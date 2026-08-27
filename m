Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC0C61DC7
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:43:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzYWD-0001UL-8O; Thu, 27 Aug 2026 07:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzYWB-0001U7-Kz
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:43:39 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzYWA-00028K-0I
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:43:39 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-66ceaade3f1so1974121d50.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831017; cv=none;
 d=google.com; s=arc-20260327;
 b=j0aj/jS2kHn1DGAqgQ0CEKvBiVr2qRFT82M53jXblk6Qji35uLaDsAVDN5nGAKf81i
 Fr3yRqnbFc2LzQkyzNic8aiheH4HmDciKYhazUANIho/jOgNhSaidldAb1oRpiF4rrxM
 NnJT2AX46KhOaD3IhAII52HbHT7ZLU/6sr5esEyfbae5zOAnTu8W/6utxVrI2FSZ4cDS
 N6aHoxeTEb8MmO9tB1fNSHCzovLShfud9Q9u8eF+1crlXnApcj/k+jPCeFsLVbuG1dHz
 uns31CA8pfnockDNxDGOJ+gTHoez31Tq8p+//YNVUXglP3uuQi2T/WF5+FTyBgf/4xuK
 m+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=U/QiQGqrVY6L6I6dyaHA0RjlF/f6uTPAhgIInOpAcag=;
 fh=Z3wuoXmodqBfl4qyJVhrRFbiR12EuuFbd8+n+UQC6So=;
 b=BLCMNpZRhHP+zNm9UHMfb5U1at/BdUgO97JOdK/F9+WIldk+Nnwy90c7HV1DZJpLoM
 7KIhOpHkg3/599KsbFttVs3PSBjV9jl9VFzzZSWLlbmTfugnu4hQBqclbK+euMQhJGxw
 TR7/zrg5WMfEE3c/ZHcu53bXlVBDCB246RnpzR/Zy4AA82+W25NSAW8Ava3Bpr/+HTxV
 iTNBfXzlHwoyKRORjVif0QrBWu3cmuoN8NnuwmnKKG5RzK+KvJo0gM8M+HoxEBcKk4gD
 xtQ2r+zGQNHZZeobJawSeNPzobuh2OflYlqcx7snNPTg86l6MTU29ig8nNthBP8DBmIo
 u6Bw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787831017; x=1788435817; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=U/QiQGqrVY6L6I6dyaHA0RjlF/f6uTPAhgIInOpAcag=;
 b=G8hd0za/qAvMfvZQOfjAouxeOH4I/1Nl+/KtfH/uDODQEO9cZqvu14p7wXyVrFo09U
 fntN/aLuS4h7M6WHwGIm99WId8faEhJyDKk3z01fAwm0IcaLn9c+eh3DER1acxE8tJFT
 feGnQG9TlrifHonMMpZXL60lTGaJp9fYj6oOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787831017; x=1788435817;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=U/QiQGqrVY6L6I6dyaHA0RjlF/f6uTPAhgIInOpAcag=;
 b=moJ3b7pMCXNzuiSnC4sTXCZDrPlzXRklBZ+vxMvFGpKbUci9nYJSrPUbxm2Jgc4Xqs
 sA7PskZC+uwFXpF296cyv8Su+ZkQ1abpGQDkTQBtOdZuxVLUwcrC+D8/t4U84Gq7XLfv
 lbRLQAMqQ584rY597aI+YO4Q8rFI48Xpe3dSaR56NP1fY15SApx7h2A+A4NTQJQkdbs4
 NIycG5A4xt5JTHW6pH/UXu3jnxytySdgX9E4JLfhKXlDBiVpSWzd7MxW+RAzDWL5MFiK
 g8T1qYP7TnADDRmBKwzvUzzav7XvI+Dbyye8YoNjAmQBQ3g0f8oatFbOR2XOKfLBzO76
 n25Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoppkRe/BS9IRGlAMMxR9fHZUANhBIuTmxEmKky5uh12P2/YNYX+1uQIhBlckSp0Az7UN1G+nsEf34g@nongnu.org
X-Gm-Message-State: AFuF++moYg1TjuFHGe/lZTMjvCJLgoNIOQixaw6Vnnv9FJR2RJjMaluz
 rVNhkyOvglkiWvrH0fR87tGTAiY7Un5FCqzRHLZyg3K6PpkySpRfAhYWFEHNcgkfglPBv+w8QES
 +Dxe7nrN/7NGc5+r8jjIiBTddpKRoqeo=
X-Gm-Gg: AR+sD12CLMGcsQ8lWolRY/nH2TKym6fScwNUohmIB/YSHH4pKx7hI9sJqJq2/8MpMee
 tmQjMnF0tAOEQy6n45O7BIvOxiulpnpUYTlT7BTml6cVgw6BVhVJ2f2W2G+2ZzVm6J3qB7U4MUQ
 Z+B1hiHjp/HhJx39T6eQTV/pX+dlkeEWpOTO0Ax38IfJmLPUOhU7j1eo69u1rE7ndtzudXvgbdc
 RVWND96dTUyKarv3NY7Rf0DVx8n39OYpgAm+oNRXsRSMLo6RxKq0bCbq/jCQLRmwtXn1UKYv4vm
 UlZ/OQpIpLiri0EDtvFGqWOZdu1aOBdvRXxrebkvtJUMJRQWAqeAbAV7tgGKKegIptKaYkTo6tY
 Cj6mct6gUP+ZU6Y1hCA1yJSI7FwDiGBsfRuCI7SP2wBal2rhI5Va7BgGDNKHHQ9c53R+HZS7hVR
 3Kgq+H9P8EkrolCwUm
X-Received: by 2002:a05:690e:12cb:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66d256827e9mr4966075d50.12.1787831016635; Thu, 27 Aug 2026
 04:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826220528.54516-9-joel@jms.id.au>
 <0da0b312-106c-418b-9827-f340a736f502@oss.qualcomm.com>
In-Reply-To: <0da0b312-106c-418b-9827-f340a736f502@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 21:13:25 +0930
X-Gm-Features: AcwNN1WzIeegeDA_EL8pclbrCytZlGwakQZ2kFExJzi4uwRLFK72xjEYfbE4QM4
Message-ID: <CACPK8Xe+2ObYr2dFFcuPfMkigLEb5bTHX2t06Xr_ZzaDvJaAtQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] hw/riscv/atlantis: Remove unused fdt_size
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 27 Aug 2026 at 20:45, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 8/26/2026 7:05 PM, Joel Stanley wrote:
> > The machine state carries around the FDT size which isn't used by
> > anything.
>
> AFAIK no RISC-V boards are doing anything with the fdt_size return value
> from create_fdt() at this moment.  Maybe they were doing it in the past and
> we just kept it around.
>
> Probably something we could clean up in other boards too.

I noticed the same. It's dead code with the variable not checked, and
in some code paths the size is not even modified by libfdt.

It was at this point in development that I found myself making
tree-wide changes and writing coccinelle scripts. I backed down for
the moment, but watch this space.

