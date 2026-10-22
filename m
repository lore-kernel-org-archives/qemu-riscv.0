Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE3606A319
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 19:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ob6CikDF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJyOa-0001wX-Jk; Thu, 22 Oct 2026 15:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcalifano@redhat.com>)
 id 1xJutL-0002aE-07
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 11:39:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcalifano@redhat.com>)
 id 1xJutJ-0000vA-1H
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 11:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792683579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRdDwD16FYdo7f8MRpViIOxs5O7sss2LQ1g4MZ9nNPM=;
 b=Ob6CikDFe5gPjlRvsJbVevNcdXOMvj+m1W5lU4SvwnbEKjsXRxQr/ma71t96wl8k/eWveK
 pk3hZBLvjG6207SRHrHs6JjEuPc1bYX5DcvRH91IJGu0EsdWY6N/bL6ruGXsLzxWGIePmm
 6cyWk7PuFjmIAJhb3ey1zLZz3lQPX54=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-lhmn18FKNJa7TDpt2kCwpw-1; Thu, 22 Oct 2026 11:39:37 -0400
X-MC-Unique: lhmn18FKNJa7TDpt2kCwpw-1
X-Mimecast-MFC-AGG-ID: lhmn18FKNJa7TDpt2kCwpw_1792683576
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4a2063be13dso7938325e9.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 08:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792683576; x=1793288376;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-type:content-transfer-encoding:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SRdDwD16FYdo7f8MRpViIOxs5O7sss2LQ1g4MZ9nNPM=;
 b=r2XSwHCuB5AQGgzYFzMlxsuQ0gXIBs32vuL+24DBf1uqo9mZ1Irv8sKpyaH5jpQBjN
 +eBDKRygR557iNynWML558dxJ+3hfwEzhLo/dg17rMT2T4+RwDSSpfW37eNc0tPB0tUx
 ggOa7r37rUJDcLfZfwH8XAuPry0G8juOpsDjCwLKWAuXQ7MyhSERS4odJ5z6qD0unVcC
 zQl5J/7Z9jE3hiFMMCV58txbvfGdCe5ezXeS3QL37kEONCosVb3eWxR/RhFnBMVXEyge
 hQFPJX4BZB5AWyBdKUzaq4pVvgnlRRyLp0l4ekS2twKvxqZKbe9BmTJA8ty15x4So5wl
 76gw==
X-Gm-Message-State: AFq9FYIzc3LMqShG1arITgu7zisiNz0h9U9gJLqEQoy65B69IxWgN2/1
 uWr0UaPpZ9PvHt/YfgryuNo0+UFQcP14xSZ+roZ5yCfYp1RcLvEy6ka3KYy4UluFDdjlu5Bv5D4
 mHZIMHG5AatmQ3k4aLsbaHNKZ+/0LYLYnGZHff8kBRjgVJ1Adczyc2qnt
X-Gm-Gg: AYBFou07k2inWreUmm5TSYk34YXwfmdpueGXh6VsUH9TcX7SKyq80LuFae5BNwI+WDK
 7sA3A4O8NazQ/JIX9vw7D8fSjg2O5KFi90XRqG/Vn0CZo4UQVrdXn5u/9WNlkeg05XiAgPHfvaY
 1SUj7nOsO8kWwfVJMOIWEO9xwH8GzTW0+1F7XAkQrtBv/XIjADTdGxV7VGYQd3CNoDcOqPalmfq
 FGxNnJoC0fdt3YgxaESHWCs2+ulhexYo2bQEYkWPwbgv4G6Rbqr4nITOb634ETRc7W6/67AkO1D
 +LKqqY14rjb8eMvyfg7tUBD+65UVgx4H5qKoTmVjIU8ctlAbOq4nOhcP6KfUTQ==
X-Received: by 2002:a05:600d:8653:20b0:4a2:5ca:767f with SMTP id
 5b1f17b1804b1-4a205ca7975mr40894045e9.4.1792683575953; 
 Thu, 22 Oct 2026 08:39:35 -0700 (PDT)
X-Received: by 2002:a05:600d:8653:20b0:4a2:5ca:767f with SMTP id
 5b1f17b1804b1-4a205ca7975mr40893675e9.4.1792683575553; 
 Thu, 22 Oct 2026 08:39:35 -0700 (PDT)
Received: from localhost ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcd13891sm91091195e9.2.2026.10.22.08.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 08:39:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 22 Oct 2026 17:39:33 +0200
Message-Id: <DMBHAGC8CCIH.KY6YB03VCSMJ@redhat.com>
To: "Anton Johansson" <anjo@rev.ng>, <qemu-devel@nongnu.org>
Cc: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <daniel.barboza@oss.qualcomm.com>,
 <liwei1518@gmail.com>, <zhiwei_liu@linux.alibaba.com>,
 <chao.liu@processmission.com>,
 <qemu-devel-bounces+tcalifano=redhat.com@nongnu.org>
Subject: Re: [PATCH] target/riscv: Fix CPU state access on big-endian hosts
From: "Tommaso Califano" <tcalifano@redhat.com>
X-Mailer: aerc 0.22.0
References: <20261022130657.6449-1-anjo@rev.ng>
In-Reply-To: <20261022130657.6449-1-anjo@rev.ng>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dYHlv2PkCOTrbUvlyyZfTs9GZt0gUiXOPlVwdhijCCo_1792683576
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tcalifano@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.339,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Oct 2026 15:24:11 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 22, 2026 at 3:06 PM CEST, Anton Johansson via qemu development w=
rote:
> mstatus and mstatus_hs are uint64_t but accessed through
>
>   tcg_gen_[ld|st]_tl(..., offsetof(mstatus))
>
> which on a big-endian host running riscv32 incorrectly accesses the
> top 32 bits rather than the lower bits.
>
> Widen the operations to 64 bit so the lower bits are modified.
>

Maybe a Fixes Tag and cc to QEMU stable?

> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/tcg/translate.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
> index ede9c2563f..79b0f444ef 100644
> --- a/target/riscv/tcg/translate.c
> +++ b/target/riscv/tcg/translate.c
> @@ -693,7 +693,7 @@ static TCGv get_address_indexed(DisasContext *ctx, in=
t rs1, TCGv offs)
>   */
>  static void mark_fs_dirty(DisasContext *ctx)
>  {
> -    TCGv tmp;
> +    TCGv_i64 tmp;
> =20
>      if (!has_ext(ctx, RVF)) {
>          return;
> @@ -703,15 +703,15 @@ static void mark_fs_dirty(DisasContext *ctx)
>          /* Remember the state change for the rest of the TB. */
>          ctx->mstatus_fs =3D EXT_STATUS_DIRTY;
> =20
> -        tmp =3D tcg_temp_new();
> -        tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> -        tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> +        tmp =3D tcg_temp_new_i64();
> +        tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> +        tcg_gen_ori_i64(tmp, tmp, MSTATUS_FS);
> +        tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> =20
>          if (ctx->virt_enabled) {
> -            tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_=
hs));
> -            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> -            tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_=
hs));
> +            tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus=
_hs));
> +            tcg_gen_ori_i64(tmp, tmp, MSTATUS_FS);
> +            tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus=
_hs));
>          }
>      }
>  }
> @@ -726,21 +726,21 @@ static inline void mark_fs_dirty(DisasContext *ctx)=
 { }
>   */
>  static void mark_vs_dirty(DisasContext *ctx)
>  {
> -    TCGv tmp;
> +    TCGv_i64 tmp;
> =20
>      if (ctx->mstatus_vs !=3D EXT_STATUS_DIRTY) {
>          /* Remember the state change for the rest of the TB.  */
>          ctx->mstatus_vs =3D EXT_STATUS_DIRTY;
> =20
> -        tmp =3D tcg_temp_new();
> -        tcg_ge\n_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
> -        tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> +        tmp =3D tcg_temp_new_i64();
> +        tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> +        tcg_gen_ori_i64(tmp, tmp, MSTATUS_VS);
> +        tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> =20
>          if (ctx->virt_enabled) {
> -            tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_=
hs));
> -            tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
> -            tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_=
hs));
> +            tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus=
_hs));
> +            tcg_gen_ori_i64(tmp, tmp, MSTATUS_VS);
> +            tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus=
_hs));
>          }
>      }
>  }

Regarding the code I am not an expert, but this fix LGTM.

Reviewed-by: Tommaso Califano <tcalifano@redhat.com>

Regards,
Tommaso


