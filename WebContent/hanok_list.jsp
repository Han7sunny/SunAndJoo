<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

    <div
      class="hero page-inner overlay"
      style="background-image: url('${root}/assets/images/hanok.jpg')"
    >
      <div class="container mb-5">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">
              써니앤쥬에서 한옥을 체험해보세요
            </h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item">
                  <a href="${root}/hanok_list.jsp">한옥 스테이</a>
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>

    <div class="section section-properties mt-5">
      <div class="container">
        <div class="row">
        <!-- item -->
        <c:forEach var="idx" begin="0" end="8" step="3">
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4  mt-5 mb-5"  data-aos="fade-up" data-aos-delay="${300+idx*100}">
            <div class="property-item mb-30">
              <a href="${root}/main?action=hanokView&zipcode=${total_hanok[idx].zipcode}" class="img align-items-center">
                <img src="${total_hanok[idx].img}" alt="Image" class="img-fluid" />
              </a>

              <div class="property-content">
                <div class="price mb-2"><span>${total_hanok[idx].title}</span></div>
                <div>
                  <span class="d-block mb-2 text-black-50"
                    >${total_hanok[idx].addr}</span
                  >
                  <span class="city d-block mb-3"></span>

                  <div class="specs d-flex mb-4">
                    <span class="d-block d-flex align-items-center me-3">
                      <span class="icon-bed me-2"></span>
                      <span class="caption">${total_hanok[idx].accept}</span>
                    </span>
                    <span class="d-block d-flex align-items-center">
                      <span class="icon-bed me-2"></span>
                      <span class="caption">${total_hanok[idx].room}</span>
                    </span>
                  </div>

                  <a
                    href="${root}/main?action=hanokView&zipcode=${total_hanok[idx].zipcode}"
                    class="btn btn-4 py-2 px-3"
                    >자세히 보기</a
                  >
                </div>
              </div>
            </div>
          </div>
        <!-- item -->
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4  mt-5 mb-5" data-aos="fade-up" data-aos-delay="${300+(idx+1)*100}">
            <div class="property-item mb-30">
              <a href="${root}/main?action=hanokView&zipcode=${total_hanok[idx+1].zipcode}" class="img">
                <img src="${total_hanok[idx+1].img}" alt="Image" class="img-fluid" />
              </a>

              <div class="property-content">
                <div class="price mb-2"><span>${total_hanok[idx+1].title}</span></div>
                <div>
                  <span class="d-block mb-2 text-black-50"
                    >${total_hanok[idx+1].addr}</span
                  >
                  <span class="city d-block mb-3"></span>

                  <div class="specs d-flex mb-4">
                    <span class="d-block d-flex align-items-center me-3">
                      <span class="icon-bed me-2"></span>
                      <span class="caption">${total_hanok[idx+1].accept}</span>
                    </span>
                    <span class="d-block d-flex align-items-center">
                      <span class="icon-bed me-2"></span>
                      <span class="caption">${total_hanok[idx+1].room}</span>
                    </span>
                  </div>

                  <a
                    href="${root}/main?action=hanokView&zipcode=${total_hanok[idx+1].zipcode}"
                    class="btn btn-4 py-2 px-3"
                    >자세히 보기</a
                  >
                </div>
              </div>
            </div>
          </div>
        <!-- item -->
          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 mt-5 mb-5" data-aos="fade-up" data-aos-delay="${300+(idx+2)*100}">
            <div class="property-item mb-30">
              <a href="${root}/main?action=hanokView&zipcode=${total_hanok[idx+2].zipcode}" class="img">
                <img src="${total_hanok[idx+2].img}" alt="Image" class="img-fluid"/>
              </a>

              <div class="property-content">
                <div class="price mb-2"><span>${total_hanok[idx+2].title}</span></div>
                <div>
                  <span class="d-block mb-2 text-black-50"
                    >${total_hanok[idx+2].addr}</span
                  >
                  <span class="city d-block mb-3"></span>

                  <div class="specs d-flex mb-4">
                    <span class="d-block d-flex align-items-center me-3">
                      <span class="icon-bed me-2"></span>
                      <span class="caption">${total_hanok[idx+2].accept}</span>
                    </span>
                    <span class="d-block d-flex align-items-center">
                      <span class="icon-bed me-2"></span>
                      <span class="caption">${total_hanok[idx+2].room}</span>
                    </span>
                  </div>

                  <a
                    href="${root}/main?action=hanokView&zipcode=${total_hanok[idx].zipcode}"
                    class="btn btn-4 py-2 px-3"
                    >자세히 보기</a
                  >
                </div>
              </div>
            </div>
          </div>
        <!-- item -->
        </c:forEach>
        </div>
      </div>
    </div>

<%@ include file="/common/footer.jsp" %>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>
