Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C34CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v324F-00084g-9k; Sun, 28 Sep 2025 20:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v324D-00084S-IF
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:48:37 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v323u-00034L-Ud
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:48:35 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6318855a83fso7546941a12.2
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759106892; x=1759711692; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4tT0it+WB/0t3VYoL1lr9jemjfZiGwYmfL35YHxr50=;
 b=DJgUw4rGAgE8s2Iz1qPhas35oPr2GZOT7cr8LXW02NU3SnQOOVbvSJZjNKto7BwD9h
 gUDx0N1B6H9Ie1q7HEk/tcZ4Oeii+pwO1bYakUSyBNQ1t/0Lm65St5g9YWlC60c1aDwZ
 uV7vFbRiS+GI8YvkRd8glx5s5iizi0/uBVulR/uyeHskn7M/MfSuS9zaoHw1arzRUSg+
 A9dULqlkOkOKNeu5SXdHVAdZ3XYNRKkri3MpMJfmC6VpK5o6bq+SY7VF8r5GIiHnGrbs
 qYS7tsjft6ydoLYaK81hKSw8F0OJ9odzgmyRm9DTc8cybD6RDk+EEBEgjg6NMEuH4bvi
 yoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759106892; x=1759711692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4tT0it+WB/0t3VYoL1lr9jemjfZiGwYmfL35YHxr50=;
 b=YsfsNI4WIJjyQ3YUVxPdxD1ayawGLiTXotSv42AmT/UcgDLMW1YljtI6h4Fxp69/Ma
 2Ooq+9Q59+exY/DeD1J8Ccunl1XcvZ0aUSGXRXkJydRcFQmbRd6YtoDiAOCV3Rk5Kqee
 MFDWit9RVt6fdE9C89srHgfRFyWYaJZHn4lID+0ML23MTVVKke9PmTgP5F/GKIE9ncIe
 YnK0sCxLoBeBY7cAOJB2Kk4F4Gg6wMoxPBvvizzv1tvSHj+G5AQ6mHgBt3C3zz1IoWNZ
 zNSYhIegO3O18SnduNpNnNxsLBd71Z1WpWGUaaoVO9q/MOFlJ0rsIr4tYZe82m5DxtZp
 5qhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAuXxbfPc98aeWOQQgrHIll/Z/y8DVWv4fE3ootNEn9lNLnCORfh35NRYcByXQYCzoOsUG2CVQJEKZ@nongnu.org
X-Gm-Message-State: AOJu0YzbVscOhL1QWuBTw72Q9AEWJpoLCYlzivPvk79hrt/a1lMxOI43
 peqGDbGPH8+mc9UmWMBfrNiUhq2JHb7KP+DCZlz5aJmnPQ+aDftyxjdDsWS5hsjcIyVvI5JD5Gv
 4HqQc+2VuGSjui8/9++SDjDcZkxisdtg=
X-Gm-Gg: ASbGncvaXjJ0YV3hKgnL6O2hB20hCLI6EqOGitKXfzaXuTlSclC7ujJOHyuhh4aq+D7
 fNv1Cxd3UT0zm7UNQm0HtJUd41mMOWYp50BdFzbgG1zy9y7YQuNS2hc9yZezEkLFTNumt4wDXXZ
 kwVHIEa0BtsapL3I3jUXdOCSH3A3YPZ0U3bRv1hVyZQP6Xfxbvibb+FwaK0UbLXopL3mMPnoPvN
 PnzCW+qQudX3HCx2076vFFdCoxkj+xGPHUNF3G5ipQVCMOU
X-Google-Smtp-Source: AGHT+IHzaKAozMrElqeb6BGRv/Ew0gjSaGxOgUsJds95QOVUNpG35lijfgNchTbLX9V0Rcd2HqXzpJij/zRuA4Gz9kg=
X-Received: by 2002:a17:907:1c15:b0:b24:3412:7cfe with SMTP id
 a640c23a62f3a-b34beca06afmr1500672066b.63.1759106892316; Sun, 28 Sep 2025
 17:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250924074818.230010-1-jim.shu@sifive.com>
 <20250924074818.230010-2-jim.shu@sifive.com>
In-Reply-To: <20250924074818.230010-2-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:47:46 +1000
X-Gm-Features: AS18NWDNcNlGqVYyMqLAKyiLQdGkfFx5a29Hut_zslimqI0L0D_qUZkukPZSWeQ
Message-ID: <CAKmqyKMCnAMCXmG5wd+6Ui_MXUYviSnBgjQMWH-q-eyhX4F7TQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] target/riscv: Fix the mepc when sspopchk triggers
 the exception
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Sep 24, 2025 at 5:50=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> When sspopchk is in the middle of TB and triggers the SW check
> exception, it should update PC from gen_update_pc(). If not, RISC-V mepc
> CSR will get wrong PC address which is still at the start of TB.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvzicfiss.c.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvzicfiss.c.inc b/target/riscv=
/insn_trans/trans_rvzicfiss.c.inc
> index b0096adcd0..45686af4d6 100644
> --- a/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> @@ -40,6 +40,7 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspop=
chk *a)
>      tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);
>      tcg_gen_st_tl(tcg_constant_tl(RISCV_EXCP_SW_CHECK_BCFI_TVAL),
>                    tcg_env, offsetof(CPURISCVState, sw_check_code));
> +    gen_update_pc(ctx, 0);
>      gen_helper_raise_exception(tcg_env,
>                    tcg_constant_i32(RISCV_EXCP_SW_CHECK));
>      gen_set_label(skip);
> --
> 2.43.0
>
>

