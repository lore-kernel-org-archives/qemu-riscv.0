Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94349C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:44:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyMcZ-0008Tv-LG; Wed, 01 Nov 2023 21:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyMbx-0007NH-Dm; Wed, 01 Nov 2023 21:35:05 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyMbt-0003Hx-No; Wed, 01 Nov 2023 21:35:03 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7b6043d0b82so171530241.1; 
 Wed, 01 Nov 2023 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698888900; x=1699493700; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0fEepzzOLobmXkKvkxn5fftan2+46rKuOteSOs4DnA=;
 b=NUE+HgPZZGJbEPblXIQ11LZB7SV4FPlm9keMkwUF1KQ/9nmSEmRkVtmfTfS19OmKpn
 h0+owsv4u21OwXaph5Oxg2dHQlgI6NCwfVoYMnuN4i0NLmujLpl/fghDChM6LPk8bXiP
 MsJLpajRyKhElHuDnUTYom5kbNW71EK1mUZMcJihFRJ6RZljvkPNoIwcV52SkTCkXcFJ
 R2fMVcMX+Jdq4lWCpp+xlqDGG8Waaf/W4IttcODgjr/hcWhypCr9kuCgTpg384216PLW
 0gmW6YVHRjaYb9ryP6ipxCrxAJXPNbjPfWHLXvgVIndN2KUgtsFlsniDdGxFI615hT41
 Rd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698888900; x=1699493700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0fEepzzOLobmXkKvkxn5fftan2+46rKuOteSOs4DnA=;
 b=Yv9K3xqQlBIgPTQwmVsPmZGU0pFtHp6fx57WbNwexWZR2rL9T4nQsPyiAcUYrE8Ajg
 xKIK2PFnfadMRQqQmwKEzV3WvVOribGxX2wbhHA8ILW0nCVTIeC6Yq67rl5jVKtNhZjy
 B05FOtXwI4fTptxgYdhjx1sBeXIS3RQtIr0q2JWgqbNAxXIgVMS+Y0KgtmoNwcj+PH63
 d1gcyPCiCX/fG/9k+W3NyXMmEVUO83bOrjwqFQ7QORxSwHpq9pcgYap2Lz/f8sMi3H+9
 ty1b0l67JxsW81gzXpe3i2fVILd8QbAYGAkgaDmSxYCay+xy4esxN1NYU85XPm8f0mwf
 ZO0g==
X-Gm-Message-State: AOJu0YyYToQHlaj1uFjamOHYvXCSMbOrUstEXs6uSGWYfy2q3wAMKNDc
 NdkqGDvMLNwHi45b+BKadv8cnyKTn4H3jswfZxM=
X-Google-Smtp-Source: AGHT+IGv7KVKTHgGJZHM7tcRclkdxkjvZHG0x7SlYe/lhdftnlco32lrfjz2Ngs87K1PsCLxqn+je/yhmCe6f/zG0n4=
X-Received: by 2002:a67:c20f:0:b0:457:c8f5:60d9 with SMTP id
 i15-20020a67c20f000000b00457c8f560d9mr16465071vsj.12.1698888899807; Wed, 01
 Nov 2023 18:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231030081607.115118-1-liweiwei@iscas.ac.cn>
 <20231030081607.115118-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20231030081607.115118-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 11:34:33 +1000
Message-ID: <CAKmqyKNGK1UacY8--t+GQQeATd_Seo4J-gT-zuQvruFGGT58gg@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: update mail address for Weiwei Li
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, lazyparser@gmail.com, 
 Weiwei Li <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Mon, Oct 30, 2023 at 6:17=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> My Iscas mail account will be disabled soon, change to my personal
> gmail account.
>
> Signed-off-by: Weiwei Li <liwei1518@gmail.com>

Thanks!

I hope you can continue working on QEMU :)

Applied to riscv-to-apply.next

Alistair

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd8d6b140f..aa5c5d4bff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -323,7 +323,7 @@ RISC-V TCG CPUs
>  M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <alistair.francis@wdc.com>
>  M: Bin Meng <bin.meng@windriver.com>
> -R: Weiwei Li <liweiwei@iscas.ac.cn>
> +R: Weiwei Li <liwei1518@gmail.com>
>  R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>  R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>  L: qemu-riscv@nongnu.org
> --
> 2.25.1
>
>

