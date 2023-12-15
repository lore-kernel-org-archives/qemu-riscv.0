Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D78C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:44:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE4kH-00034A-S9; Fri, 15 Dec 2023 04:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE4kG-00033U-Gm; Fri, 15 Dec 2023 04:44:36 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE4kE-0001hS-UQ; Fri, 15 Dec 2023 04:44:36 -0500
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7cb00cc0b5fso83141241.2; 
 Fri, 15 Dec 2023 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702633473; x=1703238273; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaXCiDoYW9a8IRL70XmRVF+7UQr3z0ZCoICLuCY7KtE=;
 b=dwVTliwdfB4NgSqvn0sL+A/F44psfdP9dnLRF+AFOY3/5s1ex45m7FmJxd/vlWlSyR
 RpZD5My6I7vm5eb50yQvuLhPJzfB62OwE+yeIruRyIUR7rtleQ69FjJkxDWQaiqISsq2
 WGMaNZGvxcvXi95nnzmqoEoP0LZNOpiLr/sIeAX86hz+DO+uK6GX41FqCclYjwOrXYK7
 yAP1kS2peUfMyyEyM6Q5VbuPq3DkB8sb3x69hyeh5ynVkN/ZYd0JKajSdIJzIiist8Ww
 Mv1Lj4ib/d+9WGJhBDMjMLwRNdQNTrmRvs2Z7T1ZZriqM0qIcSaaIZ7rkvw7th2WuTIO
 VFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702633473; x=1703238273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaXCiDoYW9a8IRL70XmRVF+7UQr3z0ZCoICLuCY7KtE=;
 b=GntqKCQhadvvV8ygy5ddi9ZQqdUE/vcnuJKIb3PlgxFgGDwq0AVx3/gIvt1rO9Ktp5
 ycPQixSTzU+iLmcb7cwczGIABk4lCDqD5ajNMzD9LlxktmhUgvfRQi7/bHNlz2RyiKCh
 uP4LgmhB+aqlNtw8ciyy0gf76uXaRxBreTD+XCG1cuVyzYYV4iw9dN4i2w2W6QduQemF
 KNEg9ckVA0ZtQ4iz2wgowt2xRzH5/To5cQfTGAH30qCa0dMwrxC7D1toOhqTEsEo77UK
 IKNFid3lXsmTcK3wWi46FhO97EV+sOJyZik3O8IkHyYmAsslSfn2QErX8roFWScRmppk
 xb8g==
X-Gm-Message-State: AOJu0Yzz7zy1pRULCpW3w2OLSFcJNAMDXTRWnRPHX+4uyFipjvbsxmCY
 Euk6hy2SznAASOAGhTqOr6Vme+UqfC3M87rILXY=
X-Google-Smtp-Source: AGHT+IGh13DQOJk8HTzqOi/z6Kun30KH3nq/uv5Vluple4J7dDIaK1SYB9YKvOMWVXGJLUtaOSTezMnZFiP9FrM1Ktk=
X-Received: by 2002:a05:6102:1522:b0:464:7969:9634 with SMTP id
 f34-20020a056102152200b0046479699634mr2089897vsv.34.1702633472998; Fri, 15
 Dec 2023 01:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20231208094315.177-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231208094315.177-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Dec 2023 19:44:07 +1000
Message-ID: <CAKmqyKPVYxVDokSh4wMRY3KyUdYra4Qxqe_W3Mu4THzb654kzQ@mail.gmail.com>
Subject: Re: [PATCH for 8.2] target/riscv: Fix th.dcache.cval1 priviledge check
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 christoph.muellner@vrull.eu, alistair.francis@wdc.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Dec 8, 2023 at 7:45=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
> According to the specification, the th.dcache.cvall1 can be executed
> under all priviledges.
> The specification about xtheadcmo located in,
> https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadcmo=
/dcache_cval1.adoc
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_xthead.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 810d76665a..dbb6411239 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -296,7 +296,7 @@ NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUI=
RE_PRIV_MS)
>  NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>  NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>  NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> -NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
>
>  NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>  NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> --
> 2.17.1
>
>

