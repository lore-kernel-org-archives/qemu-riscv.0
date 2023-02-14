Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRuBJ-0000a2-Or
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 07:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRuBH-0000ZN-V0
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 07:13:07 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRuBE-0000fp-Vv
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 07:13:07 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 v24-20020a05683011d800b0068bdd29b160so4590423otq.13
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 04:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oDvtwfiP6pIuD2DYmi008Q/s1u+MD8pHU0uoJ+IinPc=;
 b=GY1ZJ26MxZEUEAgB6Jth+tVgfKQrckg4Z14AbgZbqwxNUKMHZJ7sBskjrnjw+R9D8h
 DY3rD/IWgiJN+3HvCrGL9CRR1rN07rRBlPE7KYl5+cCJ+z8RFsfqrAKS3ytOy5OKiyJa
 afj5ISV12++ocbQuUlJXplBnTDnPfdPBQYjcOB8jlvBXvSeNKeGivs1NiZ5U3Mh3XWDr
 lz3C8NlGaP9QVOqqXL9W1mKQTLaONrrYQRsGYle0rxkKQj+4sIhuEDaHau8B/sTcjWeq
 pImEN0gXntFRnRdumX90tenwbiUti90IDs6X1yNojUVIG3MBmboDCMWtdKTY/dJLajUF
 UGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDvtwfiP6pIuD2DYmi008Q/s1u+MD8pHU0uoJ+IinPc=;
 b=m1DOB0YNmpmkTdkb3hBLrikAcEyH4lhG8j5oSIiiPxJ2JV7iQ+g2kYeyyIRkFdLk+/
 U/Zt/Sc1j6zkY4ueCMtCZ8KZtcKlM9K5mI9D1Mp/eTsb+DUNm/9/uQWQiwuJos+krU5A
 KMeC/XZ+2I+4mY0Sy7hO9Qk9A0L/dytIe6TyTMgVrgMyGIKA9H1e3trJmV7eNlWLZRg1
 rM4VP0Zsdz1tlJGFsI7nZq22v9dTscpcp740QD2gVD/qLPCEtDH522Z22oHXH9A9Kj68
 KKVCpuSTHkFAksA2opdfTA/CFXV96/nNB3b9Nld7H243pXoiPr0gYA27vnl+SHs9JBmy
 phmQ==
X-Gm-Message-State: AO0yUKUmKwG4dfer6YZ4uuA1TnCoFDSXr5qJ5y7bxOZTppQxqqiYQJOR
 jCyyRgjHEhYSuAIvQ5mXvE/VLA==
X-Google-Smtp-Source: AK7set90Q0g+aETTOb2pifpsJd7Bc4vcpF5OxMsw+9YpXI5S7G6dz1N4d1LVg0TpvUKs0kmiEclr1w==
X-Received: by 2002:a9d:6543:0:b0:670:686c:7dc with SMTP id
 q3-20020a9d6543000000b00670686c07dcmr863128otl.26.1676376782513; 
 Tue, 14 Feb 2023 04:13:02 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05683013c900b0068d4649bedasm6258039otq.67.2023.02.14.04.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 04:13:02 -0800 (PST)
Message-ID: <2710e349-78ac-e1f3-4145-2ebf2850592a@ventanamicro.com>
Date: Tue, 14 Feb 2023 09:12:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 03/14] target/riscv: Simplify the check for Zfhmin and
 Zhinxmin
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-4-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2023 12:13:08 -0000



On 2/14/23 05:38, Weiwei Li wrote:
> We needn't check Zfh and Zhinx in these instructions

Nit: missing period in the end.

> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvzfh.c.inc | 25 +++++++++++------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 2ad5716312..85fc1aa822 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -28,15 +28,14 @@
>       }                                  \
>   } while (0)
>   
> -#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> -    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
> +#define REQUIRE_ZFHMIN(ctx) do {              \
> +    if (!ctx->cfg_ptr->ext_zfhmin) {          \
>           return false;                         \
>       }                                         \
>   } while (0)
>   
> -#define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> -    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin ||          \
> -          ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
> +#define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
> +    if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
>           return false;                                        \
>       }                                                        \
>   } while (0)
> @@ -47,7 +46,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>       TCGv t0;
>   
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN(ctx);
> +    REQUIRE_ZFHMIN(ctx);
>   
>       decode_save_opc(ctx);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
> @@ -70,7 +69,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>       TCGv t0;
>   
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN(ctx);
> +    REQUIRE_ZFHMIN(ctx);
>   
>       decode_save_opc(ctx);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
> @@ -401,7 +400,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
>   static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
> +    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
>   
>       TCGv_i64 dest = dest_fpr(ctx, a->rd);
>       TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> @@ -418,7 +417,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
>   static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
> +    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
>       REQUIRE_ZDINX_OR_D(ctx);
>   
>       TCGv_i64 dest = dest_fpr(ctx, a->rd);
> @@ -436,7 +435,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
>   static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
> +    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
>   
>       TCGv_i64 dest = dest_fpr(ctx, a->rd);
>       TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> @@ -452,7 +451,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
>   static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
> +    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
>       REQUIRE_ZDINX_OR_D(ctx);
>   
>       TCGv_i64 dest = dest_fpr(ctx, a->rd);
> @@ -585,7 +584,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
>   static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN(ctx);
> +    REQUIRE_ZFHMIN(ctx);
>   
>       TCGv dest = dest_gpr(ctx, a->rd);
>   
> @@ -605,7 +604,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
>   static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_ZFH_OR_ZFHMIN(ctx);
> +    REQUIRE_ZFHMIN(ctx);
>   
>       TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
>   

