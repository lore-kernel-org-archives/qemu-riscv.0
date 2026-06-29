Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFBC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 09:37:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we8Qj-0005Xn-5o; Mon, 29 Jun 2026 05:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1we8Qh-0005XN-W1
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 05:37:28 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1we8Qg-0005vZ-KX
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 05:37:27 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664db84f074so669180d50.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 02:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782725845; cv=none;
 d=google.com; s=arc-20260327;
 b=IVea0tqTS6OGrrBeO/qD33wJID7AfPiozUR7vi+wYuhO/IQMjZTTKlLCla8NlpHybf
 4dXol5URUr0EZ8oLbLrVkLVtwHaxWd69m+vv2H7eQb4N05dJALBBOnjjBxcsSiIx+JEj
 d5kP0xBK+GTexGz4ypnbvCpoygMrFvtlDP50mfYiiEODYqtFZMktaH98mvSMpgg7NwYF
 dyVl2H2nMxaRyM40TPCpXpu/m3/xBJkI48bnxeFj8kVZysGSVa8wZWEwDDTZD6FSot8+
 mCo5mmQ3n5yRVqSVx38tqvF/l0jhDczhQHXRe5DxXBMVW+AJ2Ap8YMx9Pl8G3vuFqhfC
 7Z2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=P7AVEPFLnRY/5u2ut8KHApVZxd4dZGS7HtC7IqvLc4k=;
 fh=2RGGyQqHWe5hDu2aX4p4TtlS2UdAEiJDbP1NOgTO8Z8=;
 b=cYLwMJDVri28CYaglCzus9byZd3M2Z1Nh7TSdGXqH5m28EO5WEkTl1Q+cDZZBa5WTQ
 AcRBirY8ZpQYWUrAYqhSys4fen20wgeH07Z2S5MiS1xgc1zKo+EymESaShSZ5vOFftBU
 a7CnsOhZBrL1GXZ1XQ3vTSHbBPVSg5/+3od5LXAS3lpzVq1oeVBMIeQ3NEzStf2fDNx9
 AveuE7arrn3Bgbi+oVjpD4P9X1us43ddx8W2W7Bv4tiAeP7XHVXUot+Ssr/wQfYxsimN
 BTUh1P+sFzfcTgw+ppULdURtBKdl7zTDOejKcShE47ErTFiArvrS14m6alXafzokTqis
 bfQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782725845; x=1783330645; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P7AVEPFLnRY/5u2ut8KHApVZxd4dZGS7HtC7IqvLc4k=;
 b=uHBo7e9bgSbEhcU0cc4F1DzjY5e0xxTUl0oBEnTt+0Vs6v//lZ3gJ6+txWoPRR/qiR
 +Pdj7ECfSkJymgTzUks0E+cIpQ84XUDSXXH6dat9JGBOAmUbAR7GEjDHwc9LEj6lLCm/
 ESKY3Yz9jkEBSka1nNNjb3KESsAIi9drVPqXazk5SQdanBpkA/X15jeN9VmNFqzCcWwd
 tSw/6TfL47Llf1nAqnlKvwVODam+rjrGbcFIfSZUQ7cKav/kYVdiHi88a7o9acul77Vd
 m5AmD4JeT/mj1eWbXg5xBJLor+581QO5ED495sTddihMU10jknQsiH0s3IdOZeprnXp3
 noIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782725845; x=1783330645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7AVEPFLnRY/5u2ut8KHApVZxd4dZGS7HtC7IqvLc4k=;
 b=jsktIuUEe48+JJ/cWdbW3gp34CeSByeO7tLzt+3qowJ0X7ChPASMZHTFG8jtd6y5Ml
 ygOZ3SS+WhMZHPXXXSvAwWlrBDu0HKTE+ZiL12INuQvIC13IOMr5fj09Gt8Krv1CnVwm
 d40eUlTF8b67UbMqwLuPTA/+m+E30RTzFWBVAC6Z63rdgptUi1UAh0N+1IJXUeb4ZmZ/
 AaFjDgsIEvS9lb2/soi91OXqlvD3qU+Wgt3uomavzJvkbL0vpAOAUZWK+ZIGEzElo40P
 94InsRTFNoXbdZyauLE6lXjteRw75pN3nT5ryR6YkiAJibQuFF1xXC+5F3yvfd6R+5SQ
 3uLQ==
X-Gm-Message-State: AOJu0Yxp9m8HLA0ndhXGYTa75tS0lRne8jHB1UWu3XD1e3+zCqu87hSN
 JdvqxGTBCdkeFKYMjzX/zU6Tx9JreZDLdm+t52zQgx6kmMkjYsChZalXKdQSUJbP2J9qDYhD6+R
 Ou6eyRhxoLa8oK0Pcn5cP5zgf1myqIhrI8hsWK06JOw==
X-Gm-Gg: AfdE7cm8xieN2H9fCz/KmvexCq7TB7Wjn8VE7IRx+gh/261ffUFR44pPRXzeRUuSdUR
 9TjsY2ti7KI4zdtq/Kf+2akV5X2wC/eGBtE59qWC2cXAKtRZcc7NKPzhbe60y1fCX8IZTB7u9Rg
 uGBb3K9GcNrsuRZbXkEUfEg1GGKFLv733R7+ph29K2ta2RfCd4Q3Ed9Q9uIXDZjj+TZe34REgtQ
 64r7TYxPTgi7/Y12fuUN3kiBhnigvM7qbgOH5as/1rHenpVncqXbO6fPqwm052uM5cXvdCJBz8k
 dK2fSUPzeWWxJByXnHIer7U2RDSBBZSnJPApwwSgzlZCk22Jyq5OJE3l
X-Received: by 2002:a05:690e:d03:b0:664:e5c5:5b52 with SMTP id
 956f58d0204a3-664e5c563f0mr951436d50.14.1782725845181; Mon, 29 Jun 2026
 02:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_AB4D09097B1EC06F8C6CD11DF2C14E8A6D05@qq.com>
In-Reply-To: <tencent_AB4D09097B1EC06F8C6CD11DF2C14E8A6D05@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2026 10:37:13 +0100
X-Gm-Features: AVVi8Cfpo_Ay-T8EpJ4TF8hVnJqiba_UhYymKnRddg84THXEYUgpynKV6IIiVZA
Message-ID: <CAFEAcA9qpbF+hFpuYpqZrepozryA=ZuDhHLijYAZucumfAMkGQ@mail.gmail.com>
Subject: Re: [PATCH v1] riscv/virt: Add secondary UART
To: Yanfeng Liu <yfliu2008@qq.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 28 Jun 2026 at 08:06, Yanfeng Liu <yfliu2008@qq.com> wrote:
>
> This adds secondary UART device to RiscV virt board to simplify
> multi-core bare-metal development as Virtio needs comparably
> more work.
>
> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---

Just a note that for other architectures we have seen the
addition of an extra UART cause breakage for previously
working guests, usually because they took the approach of
"find the first UART node in the DTB" and/or because
different software at different levels of the stack was
looking for the UART in the DTB differently and so you
ended up with e.g. UEFI outputting on one UART and the
kernel on the other. A particular trap is that the order
of nodes in the final DTB ends up being the reverse of the
order in which they are added in the code in QEMU.

Compare commit 5d8a250f9068 (openrisc) and e7100972f2 (arm)
for descriptions of some of the things we've run into and
the measures we've taken as a result. It's possible that
not all of these will be relevant for riscv but it's quite
likely that some will.

thanks
-- PMM

