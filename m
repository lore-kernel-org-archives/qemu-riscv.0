Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAa2n-0000SI-Rw
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa2i-0000Qv-Nw; Fri, 12 Feb 2021 10:07:36 -0500
Received: from mail142-5.mail.alibaba.com ([198.11.142.5]:10626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa2c-0005aj-9K; Fri, 12 Feb 2021 10:07:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0586287-0.00124392-0.940127;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGn62W_1613142433; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGn62W_1613142433)
 by smtp.aliyun-inc.com(10.147.44.129);
 Fri, 12 Feb 2021 23:07:13 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 02/38] target/riscv: Hoist vector functions
Date: Fri, 12 Feb 2021 23:02:20 +0800
Message-Id: <20210212150256.885-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=198.11.142.5; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-5.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2021 15:07:40 -0000

The saturate functions about add,subtract and shift functions can
be used in packed extension.Therefore hoist them up.

The endianess process macro is also be hoisted.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/internals.h     | 50 ++++++++++++++++++++++
 target/riscv/vector_helper.c | 82 +++++++++++-------------------------
 2 files changed, 74 insertions(+), 58 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb..698158e116 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -58,4 +58,54 @@ static inline float32 check_nanbox_s(uint64_t f)
     }
 }
 
+/*
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing units smaller than that needs a host-endian fixup.
+ */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)   ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
+#define H2(x)   ((x) ^ 3)
+#define H4(x)   ((x) ^ 1)
+#define H8(x)   ((x))
+#else
+#define H1(x)   (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
+#define H2(x)   (x)
+#define H4(x)   (x)
+#define H8(x)   (x)
+#endif
+
+/* share functions about saturation */
+int8_t sadd8(CPURISCVState *, int vxrm, int8_t, int8_t);
+int16_t sadd16(CPURISCVState *, int vxrm, int16_t, int16_t);
+int32_t sadd32(CPURISCVState *, int vxrm, int32_t, int32_t);
+int64_t sadd64(CPURISCVState *, int vxrm, int64_t, int64_t);
+
+uint8_t saddu8(CPURISCVState *, int vxrm, uint8_t, uint8_t);
+uint16_t saddu16(CPURISCVState *, int vxrm, uint16_t, uint16_t);
+uint32_t saddu32(CPURISCVState *, int vxrm, uint32_t, uint32_t);
+uint64_t saddu64(CPURISCVState *, int vxrm, uint64_t, uint64_t);
+
+int8_t ssub8(CPURISCVState *, int vxrm, int8_t, int8_t);
+int16_t ssub16(CPURISCVState *, int vxrm, int16_t, int16_t);
+int32_t ssub32(CPURISCVState *, int vxrm, int32_t, int32_t);
+int64_t ssub64(CPURISCVState *, int vxrm, int64_t, int64_t);
+
+uint8_t ssubu8(CPURISCVState *, int vxrm, uint8_t, uint8_t);
+uint16_t ssubu16(CPURISCVState *, int vxrm, uint16_t, uint16_t);
+uint32_t ssubu32(CPURISCVState *, int vxrm, uint32_t, uint32_t);
+uint64_t ssubu64(CPURISCVState *, int vxrm, uint64_t, uint64_t);
+
+/* share shift functions */
+int8_t vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b);
+int16_t vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b);
+int32_t vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b);
+int64_t vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b);
+uint8_t vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b);
+uint16_t vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b);
+uint32_t vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b);
+uint64_t vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b);
 #endif
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d28..9371d70f6b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -56,26 +56,6 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     return vl;
 }
 
-/*
- * Note that vector data is stored in host-endian 64-bit chunks,
- * so addressing units smaller than that needs a host-endian fixup.
- */
-#ifdef HOST_WORDS_BIGENDIAN
-#define H1(x)   ((x) ^ 7)
-#define H1_2(x) ((x) ^ 6)
-#define H1_4(x) ((x) ^ 4)
-#define H2(x)   ((x) ^ 3)
-#define H4(x)   ((x) ^ 1)
-#define H8(x)   ((x))
-#else
-#define H1(x)   (x)
-#define H1_2(x) (x)
-#define H1_4(x) (x)
-#define H2(x)   (x)
-#define H4(x)   (x)
-#define H8(x)   (x)
-#endif
-
 static inline uint32_t vext_nf(uint32_t desc)
 {
     return FIELD_EX32(simd_data(desc), VDATA, NF);
@@ -2199,7 +2179,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                  do_##NAME, CLEAR_FN);                          \
 }
 
-static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
 {
     uint8_t res = a + b;
     if (res < a) {
@@ -2209,8 +2189,7 @@ static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     return res;
 }
 
-static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
-                               uint16_t b)
+uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
 {
     uint16_t res = a + b;
     if (res < a) {
@@ -2220,8 +2199,7 @@ static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
     return res;
 }
 
-static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
-                               uint32_t b)
+uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
     if (res < a) {
@@ -2231,8 +2209,7 @@ static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
     return res;
 }
 
-static inline uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a,
-                               uint64_t b)
+uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
 {
     uint64_t res = a + b;
     if (res < a) {
@@ -2328,7 +2305,7 @@ GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8, clearq)
 
-static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT8_MIN) {
@@ -2338,7 +2315,7 @@ static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT16_MIN) {
@@ -2348,7 +2325,7 @@ static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT32_MIN) {
@@ -2358,7 +2335,7 @@ static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT64_MIN) {
@@ -2386,7 +2363,7 @@ GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8, clearq)
 
-static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
 {
     uint8_t res = a - b;
     if (res > a) {
@@ -2396,8 +2373,7 @@ static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     return res;
 }
 
-static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
-                               uint16_t b)
+uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
 {
     uint16_t res = a - b;
     if (res > a) {
@@ -2407,8 +2383,7 @@ static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
     return res;
 }
 
-static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
-                               uint32_t b)
+uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
 {
     uint32_t res = a - b;
     if (res > a) {
@@ -2418,8 +2393,7 @@ static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
     return res;
 }
 
-static inline uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a,
-                               uint64_t b)
+uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
 {
     uint64_t res = a - b;
     if (res > a) {
@@ -2447,7 +2421,7 @@ GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8, clearq)
 
-static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
@@ -2457,7 +2431,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
@@ -2467,7 +2441,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
@@ -2477,7 +2451,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
@@ -2918,8 +2892,7 @@ GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4, clearl)
 GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8, clearq)
 
 /* Vector Single-Width Scaling Shift Instructions */
-static inline uint8_t
-vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+uint8_t vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
 {
     uint8_t round, shift = b & 0x7;
     uint8_t res;
@@ -2928,8 +2901,7 @@ vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline uint16_t
-vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
+uint16_t vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
 {
     uint8_t round, shift = b & 0xf;
     uint16_t res;
@@ -2938,8 +2910,7 @@ vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline uint32_t
-vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
+uint32_t vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
 {
     uint8_t round, shift = b & 0x1f;
     uint32_t res;
@@ -2948,8 +2919,7 @@ vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline uint64_t
-vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
+uint64_t vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
 {
     uint8_t round, shift = b & 0x3f;
     uint64_t res;
@@ -2976,8 +2946,7 @@ GEN_VEXT_VX_RM(vssrl_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssrl_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssrl_vx_d, 8, 8, clearq)
 
-static inline int8_t
-vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+int8_t vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     uint8_t round, shift = b & 0x7;
     int8_t res;
@@ -2986,8 +2955,7 @@ vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline int16_t
-vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+int16_t vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     uint8_t round, shift = b & 0xf;
     int16_t res;
@@ -2996,8 +2964,7 @@ vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline int32_t
-vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+int32_t vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     uint8_t round, shift = b & 0x1f;
     int32_t res;
@@ -3006,8 +2973,7 @@ vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline int64_t
-vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+int64_t vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     uint8_t round, shift = b & 0x3f;
     int64_t res;
-- 
2.17.1


