Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJd5a-0004DC-GD
	for mharc-qemu-riscv@gnu.org; Tue, 09 Mar 2021 09:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJd5X-0004Ad-7Z; Tue, 09 Mar 2021 09:11:55 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJd5T-0007ZK-Pr; Tue, 09 Mar 2021 09:11:54 -0500
Received: by mail-io1-xd35.google.com with SMTP id n14so14055663iog.3;
 Tue, 09 Mar 2021 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P98G5FgP4ofKtS94fNxqCXpE+ISkoIREucLbQZ2OkDA=;
 b=F7wlvRIeGxv4KKWe3uCFLyzLj/K7DjuElnwMhlTdkE/V/XDeStMdaRplkoTQtE1J0A
 3qmCpicUPoSNE1Dqqntu/NAEhc6MwwnRvJuXsnmhPiFxwJKspmhHqy6TXUBpp7uqY844
 ylXkZQKyotjmwlAJ4m6o47dR1MR8cqBA86u4T7zCLW280QQ7Rp8QBNO3SEWUc6qhQ+t4
 tU9SmNGjz+Q7P6qjgj9fqSGGYz8jRUZD1qYKurgoJA3HEltdNybQE82XbJ1GVIeSw2M4
 85rPZ3OPgYJn2lMHgat022nf7gon5mkkg9Z+ZT63h7p1+ehXHJ/HwK5PBUrtCBlIUOMn
 ENEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P98G5FgP4ofKtS94fNxqCXpE+ISkoIREucLbQZ2OkDA=;
 b=hIzC4yC5GHC6/jfNPOWxIwG6d6Fy02eAJpEfNd6hAyhm1W8izJShV24dhAeC/EIn1c
 Vj4AUzEu5hxPPGLTJT3ncyTrU3PSrPmEzmUAhZYsycj1KLk8fF1kLXtQQbjm3U2mGJfl
 iyA4yaGtaAhwmefVIuey0NTTSm26G3998IlG4FC1Z6ej4MB2BWrBdidF6co1HODqPg1N
 /HQh1vlGkimTlA9O3DpnUblEfvxLT4SMQSGerxDTk2zLJc4cDrhP8kPzL9Hezxg24ePR
 /kuAmeWV5tLpq9xVlg6Imq512WI0kSt1fqhhV8afjyV+cVGT+qGZ37qvqZ6T1sCIFBB+
 1ROQ==
X-Gm-Message-State: AOAM532orN1qFDh1+dYMzIwg4qQ56FXUy9/+xhxjOhKqSsxhRS2Wm2Za
 jU/7C7urgja4gZcxqYRGv1L/BaqK6gr2zTRpRwo/vVj+Aas=
X-Google-Smtp-Source: ABdhPJwmTE4zoatHBWo4pi9RCUt2nauaCwkZlu62l2psiitdrETYJDZxeBM+RQK5uoE4YfAY9H1U+nllK/2xBRXVR2s=
X-Received: by 2002:a05:6602:2287:: with SMTP id
 d7mr23070753iod.42.1615299109140; 
 Tue, 09 Mar 2021 06:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-3-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-3-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:10:28 -0500
Message-ID: <CAKmqyKM5AAAi42p-mMot_dhrcs59QDAbVdgHpnvtZr-3YEKnaQ@mail.gmail.com>
Subject: Re: [PATCH 02/38] target/riscv: Hoist vector functions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Mar 2021 14:11:56 -0000

On Fri, Feb 12, 2021 at 10:07 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The saturate functions about add,subtract and shift functions can
> be used in packed extension.Therefore hoist them up.

A better title might be:

target/riscv: Make the vector helper functions public

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> The endianess process macro is also be hoisted.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/internals.h     | 50 ++++++++++++++++++++++
>  target/riscv/vector_helper.c | 82 +++++++++++-------------------------
>  2 files changed, 74 insertions(+), 58 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b15ad394bb..698158e116 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -58,4 +58,54 @@ static inline float32 check_nanbox_s(uint64_t f)
>      }
>  }
>
> +/*
> + * Note that vector data is stored in host-endian 64-bit chunks,
> + * so addressing units smaller than that needs a host-endian fixup.
> + */
> +#ifdef HOST_WORDS_BIGENDIAN
> +#define H1(x)   ((x) ^ 7)
> +#define H1_2(x) ((x) ^ 6)
> +#define H1_4(x) ((x) ^ 4)
> +#define H2(x)   ((x) ^ 3)
> +#define H4(x)   ((x) ^ 1)
> +#define H8(x)   ((x))
> +#else
> +#define H1(x)   (x)
> +#define H1_2(x) (x)
> +#define H1_4(x) (x)
> +#define H2(x)   (x)
> +#define H4(x)   (x)
> +#define H8(x)   (x)
> +#endif
> +
> +/* share functions about saturation */
> +int8_t sadd8(CPURISCVState *, int vxrm, int8_t, int8_t);
> +int16_t sadd16(CPURISCVState *, int vxrm, int16_t, int16_t);
> +int32_t sadd32(CPURISCVState *, int vxrm, int32_t, int32_t);
> +int64_t sadd64(CPURISCVState *, int vxrm, int64_t, int64_t);
> +
> +uint8_t saddu8(CPURISCVState *, int vxrm, uint8_t, uint8_t);
> +uint16_t saddu16(CPURISCVState *, int vxrm, uint16_t, uint16_t);
> +uint32_t saddu32(CPURISCVState *, int vxrm, uint32_t, uint32_t);
> +uint64_t saddu64(CPURISCVState *, int vxrm, uint64_t, uint64_t);
> +
> +int8_t ssub8(CPURISCVState *, int vxrm, int8_t, int8_t);
> +int16_t ssub16(CPURISCVState *, int vxrm, int16_t, int16_t);
> +int32_t ssub32(CPURISCVState *, int vxrm, int32_t, int32_t);
> +int64_t ssub64(CPURISCVState *, int vxrm, int64_t, int64_t);
> +
> +uint8_t ssubu8(CPURISCVState *, int vxrm, uint8_t, uint8_t);
> +uint16_t ssubu16(CPURISCVState *, int vxrm, uint16_t, uint16_t);
> +uint32_t ssubu32(CPURISCVState *, int vxrm, uint32_t, uint32_t);
> +uint64_t ssubu64(CPURISCVState *, int vxrm, uint64_t, uint64_t);
> +
> +/* share shift functions */
> +int8_t vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b);
> +int16_t vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b);
> +int32_t vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b);
> +int64_t vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b);
> +uint8_t vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b);
> +uint16_t vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b);
> +uint32_t vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b);
> +uint64_t vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b);
>  #endif
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a156573d28..9371d70f6b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -56,26 +56,6 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>      return vl;
>  }
>
> -/*
> - * Note that vector data is stored in host-endian 64-bit chunks,
> - * so addressing units smaller than that needs a host-endian fixup.
> - */
> -#ifdef HOST_WORDS_BIGENDIAN
> -#define H1(x)   ((x) ^ 7)
> -#define H1_2(x) ((x) ^ 6)
> -#define H1_4(x) ((x) ^ 4)
> -#define H2(x)   ((x) ^ 3)
> -#define H4(x)   ((x) ^ 1)
> -#define H8(x)   ((x))
> -#else
> -#define H1(x)   (x)
> -#define H1_2(x) (x)
> -#define H1_4(x) (x)
> -#define H2(x)   (x)
> -#define H4(x)   (x)
> -#define H8(x)   (x)
> -#endif
> -
>  static inline uint32_t vext_nf(uint32_t desc)
>  {
>      return FIELD_EX32(simd_data(desc), VDATA, NF);
> @@ -2199,7 +2179,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
>                   do_##NAME, CLEAR_FN);                          \
>  }
>
> -static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
> +uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
>  {
>      uint8_t res = a + b;
>      if (res < a) {
> @@ -2209,8 +2189,7 @@ static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
>      return res;
>  }
>
> -static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
> -                               uint16_t b)
> +uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
>  {
>      uint16_t res = a + b;
>      if (res < a) {
> @@ -2220,8 +2199,7 @@ static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
>      return res;
>  }
>
> -static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
> -                               uint32_t b)
> +uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
>  {
>      uint32_t res = a + b;
>      if (res < a) {
> @@ -2231,8 +2209,7 @@ static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
>      return res;
>  }
>
> -static inline uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a,
> -                               uint64_t b)
> +uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
>  {
>      uint64_t res = a + b;
>      if (res < a) {
> @@ -2328,7 +2305,7 @@ GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2, clearh)
>  GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4, clearl)
>  GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8, clearq)
>
> -static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
> +int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>  {
>      int8_t res = a + b;
>      if ((res ^ a) & (res ^ b) & INT8_MIN) {
> @@ -2338,7 +2315,7 @@ static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>      return res;
>  }
>
> -static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
> +int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>  {
>      int16_t res = a + b;
>      if ((res ^ a) & (res ^ b) & INT16_MIN) {
> @@ -2348,7 +2325,7 @@ static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>      return res;
>  }
>
> -static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
> +int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>  {
>      int32_t res = a + b;
>      if ((res ^ a) & (res ^ b) & INT32_MIN) {
> @@ -2358,7 +2335,7 @@ static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>      return res;
>  }
>
> -static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
> +int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
>  {
>      int64_t res = a + b;
>      if ((res ^ a) & (res ^ b) & INT64_MIN) {
> @@ -2386,7 +2363,7 @@ GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2, clearh)
>  GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4, clearl)
>  GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8, clearq)
>
> -static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
> +uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
>  {
>      uint8_t res = a - b;
>      if (res > a) {
> @@ -2396,8 +2373,7 @@ static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
>      return res;
>  }
>
> -static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
> -                               uint16_t b)
> +uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
>  {
>      uint16_t res = a - b;
>      if (res > a) {
> @@ -2407,8 +2383,7 @@ static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
>      return res;
>  }
>
> -static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
> -                               uint32_t b)
> +uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
>  {
>      uint32_t res = a - b;
>      if (res > a) {
> @@ -2418,8 +2393,7 @@ static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
>      return res;
>  }
>
> -static inline uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a,
> -                               uint64_t b)
> +uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
>  {
>      uint64_t res = a - b;
>      if (res > a) {
> @@ -2447,7 +2421,7 @@ GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2, clearh)
>  GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4, clearl)
>  GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8, clearq)
>
> -static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
> +int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>  {
>      int8_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT8_MIN) {
> @@ -2457,7 +2431,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>      return res;
>  }
>
> -static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
> +int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>  {
>      int16_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT16_MIN) {
> @@ -2467,7 +2441,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>      return res;
>  }
>
> -static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
> +int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>  {
>      int32_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT32_MIN) {
> @@ -2477,7 +2451,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>      return res;
>  }
>
> -static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
> +int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
>  {
>      int64_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT64_MIN) {
> @@ -2918,8 +2892,7 @@ GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4, clearl)
>  GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8, clearq)
>
>  /* Vector Single-Width Scaling Shift Instructions */
> -static inline uint8_t
> -vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
> +uint8_t vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
>  {
>      uint8_t round, shift = b & 0x7;
>      uint8_t res;
> @@ -2928,8 +2901,7 @@ vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
>      res   = (a >> shift)  + round;
>      return res;
>  }
> -static inline uint16_t
> -vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
> +uint16_t vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
>  {
>      uint8_t round, shift = b & 0xf;
>      uint16_t res;
> @@ -2938,8 +2910,7 @@ vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
>      res   = (a >> shift)  + round;
>      return res;
>  }
> -static inline uint32_t
> -vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
> +uint32_t vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
>  {
>      uint8_t round, shift = b & 0x1f;
>      uint32_t res;
> @@ -2948,8 +2919,7 @@ vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
>      res   = (a >> shift)  + round;
>      return res;
>  }
> -static inline uint64_t
> -vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
> +uint64_t vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
>  {
>      uint8_t round, shift = b & 0x3f;
>      uint64_t res;
> @@ -2976,8 +2946,7 @@ GEN_VEXT_VX_RM(vssrl_vx_h, 2, 2, clearh)
>  GEN_VEXT_VX_RM(vssrl_vx_w, 4, 4, clearl)
>  GEN_VEXT_VX_RM(vssrl_vx_d, 8, 8, clearq)
>
> -static inline int8_t
> -vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
> +int8_t vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>  {
>      uint8_t round, shift = b & 0x7;
>      int8_t res;
> @@ -2986,8 +2955,7 @@ vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>      res   = (a >> shift)  + round;
>      return res;
>  }
> -static inline int16_t
> -vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
> +int16_t vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>  {
>      uint8_t round, shift = b & 0xf;
>      int16_t res;
> @@ -2996,8 +2964,7 @@ vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>      res   = (a >> shift)  + round;
>      return res;
>  }
> -static inline int32_t
> -vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
> +int32_t vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>  {
>      uint8_t round, shift = b & 0x1f;
>      int32_t res;
> @@ -3006,8 +2973,7 @@ vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>      res   = (a >> shift)  + round;
>      return res;
>  }
> -static inline int64_t
> -vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
> +int64_t vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
>  {
>      uint8_t round, shift = b & 0x3f;
>      int64_t res;
> --
> 2.17.1
>

