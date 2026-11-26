Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ACC606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Jn74EBfo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWPmb-0002sg-4b; Wed, 25 Nov 2026 22:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xWPma-0002sN-1R
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 22:04:24 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xWPmU-0008H3-Rj
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 22:04:23 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6767d92cde6so7253873d50.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 19:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662257; cv=none;
 d=google.com; s=arc-20260327;
 b=aWSUWZjbSiAA95K/lh1q3z1WJCixF0kHDi4jAt8OhYP8UrINjn6260sQRJxIU9SaD8
 m2edOL2GP3GFRbe5G/6xZ9rpT1pqt1v1bVbCi/OziPdQ2nyY8JlrNNRHZtRi3ZnJIZaX
 GWyqutWO13lbd4TKot2HC9L3EZn1IXxQXvl4I91axNz+JQlyobg0IEeEIViwxFDo9V6A
 qK6c3V5t9H0/EI/bJklZcAvU6qqTDyCRvZgswNapRjp1f/7+qAjsJecTGom2BJ34nfkg
 /FYQs2Fa4Hom6PomN/uTpjwHPAGQ2nZZUuQF9Q+GqRkC3GU/sSZksiqTkZuVY8bNQfbz
 2UHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xlWHPFuqk5N+v92mFgbucowqaX2ho2OkoZHRJ2Idrh0=;
 fh=gXCidvcPJnZ4gvxdKSteKjxydnopgPZcHCJYJUm1MAA=;
 b=f72meMCn160hZ4MFrMn8NEB22d6BMK0IrE2RZDQybHigc5fUZozDGTOF8ezTgHOkKf
 aTV4jmYT/zeIzD6ti8QSo7UQ7lbM6xKSnIAhqQ0LObvfL9/FoP9jWcLmR1qBOIDp4RCu
 feJAEQbHskdpolDPn6P/vO12CoDSeuEdYXBAk0dFdqXiNNUIXNaKvHBrttdyEB0Y1arx
 xmD4wBz4Iit9ABKLdlcgwZWToOasyO9Sio5Tiv/FnGyI9xfAGMjn1rYIcmCcoimBIsY+
 VsoCunI4g7UjGMKUH+cQXvmBHdhdmp70DM/dFNt/V0nQ1nMPnweqBKY1Lo74PWk9a0ez
 EdiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795662257; x=1796267057; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xlWHPFuqk5N+v92mFgbucowqaX2ho2OkoZHRJ2Idrh0=;
 b=Jn74EBfo+XM/sTC16kn8R0ztb9GryD4kMnGDZPHDA95ST0dHzcEzdLRl5Ijnniw0J+
 L4KXj3IhAx8h+PGjkCweLAAW6TzOr1VBBQlbZOJaoCTyZ1vCzjbi04uu1HE7KDIDTeES
 ItFb0uoeMG7nXkIIhYHC5FIqOb4CjQtl0Tx3QoVCy81im/2k0mGx/0G3NBCTwaDwU/Dk
 3zHTFCg0YP+mL5hdJovAhEOsh9xjnLGEA7gN59bjDMbNCWlTHLw/eGWJJjihLvpGFWtB
 3GuPXpfsQk6hB3xIqqwjAuOc+NNvFWupRZlXHMQRvUSpNvq4sf69CtcIFtg0AUIjdkta
 gT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795662257; x=1796267057;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xlWHPFuqk5N+v92mFgbucowqaX2ho2OkoZHRJ2Idrh0=;
 b=UwXODD2g2s/zDWfNFS+q8GtWINIozPi2tfZMGNrnj0RjabR+k1zifvvm30hsd6drRi
 gS7ni1m+wb0jV7WV3RIWVBXpyVEaTOeWIraI0Md4xZ1b5zQdWapV5S3AenGn+FZT2Qg2
 ut89d6bbf2MCcJUU13YTLZa/nLgHYJUQvnRLQJTMf7P0MWRJ3mVe8bVvEZrUm21dtxMO
 zyTjWbX2v6vP2O+zOzuzBv5EjVZApU95a3JDfVs2jxuYalxzyEPl0ukHb7X2lr5/kDDR
 EAMcPyijwcD93BXZlE0dDzw8lKrE3PGmC0mS1uh+MoghUle9OqIlqsWsL9OnBG/0fQaF
 H/mA==
X-Forwarded-Encrypted: i=1;
 AL+hErFW8DKPzyW1RpZvRFwy0poVbdVWqwYHHFXW4i59+PTOPf0nXWC/gXR1y8cSZ35T9XbLVGt/qMRFBLaH@nongnu.org
X-Gm-Message-State: APuU4Z8cF+i4BkFkWZcTRG/isYO14Gjgh6Mv1fhSHVNSnpRiOWadSGsT
 E0PGToV1SvvOh15w6hIfFy7tKC9wdlnz2Bcab5YjKMNlCE36at80W6e4HqXTBS9yj4qiDr/0dQl
 CuLRGEG1WvWApJ92C57jqVOEF4rkHmRne4zqHRSPKBA==
X-Gm-Gg: AZFdTZcyZIipsOLc355gjFJPq87YjGnF31BeBh5dQAE5ZX3dFhqqQ2cL6zljlkW2yyI
 lEs5EOpELijNFYSVCz7Xwn/6S+6QZzP5+0DKoWYZp6wvEHkg1qHwD5T8G6VGaYlb0tHi7rqL/Ck
 yfSOxfEY6NyncFXFN6cn2CyZg4KRWPEn75KhFObNDm6vMdy/fFblO4SoTZF/MB3zbkjpR+QJ0S1
 SVCZEhwX+6Ivbo4Wc/qeaSFj0ZQAW0y87QNTecP8KYbdWnD30nlOmuja21ETWFE3D0CoYpe4BFn
 64zfT8OnJdBSfDhGVpJa0xjTdEKjSOPdoJdCk7CuL/ZTYu6r62t6KUTibqUoScXcNTheNzqUi4y
 8bmAF6/cxmKG1GsBCIpjUZKipu7xLBufHN1JehSj7glw3d15S4s5vGinLL51XcGvuTFu7s7WVxP
 Y6L/UH0GXTLsF7CJHMyKTM0fVlqwLi+yfgcUOsdh5iaNGFd9A=
X-Received: by 2002:a05:690e:144e:b0:67c:271e:c28f with SMTP id
 956f58d0204a3-67df43ce2bamr9482552d50.31.1795662257152; Wed, 25 Nov 2026
 19:04:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
 <CAEev2e9YBm-rA1+-mmw-qF-5dLw7uO0o=knHh30KAyDVepBsfQ@mail.gmail.com>
 <20261126023501.460848-1-w1355457260@gmail.com>
In-Reply-To: <20261126023501.460848-1-w1355457260@gmail.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 25 Nov 2026 21:04:04 -0600
X-Gm-Features: Aa3M54qK8gsW2xmOFDckolhTpc2vnwjYp7Mvcoj9l9EJM2ALGF2hQOtl0pRWJBc
Message-ID: <CAEev2e88RWAx_FhZZZHY1vQs3KTNFS+S1R6G4qdEdzzaivZCSA@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 0/8] Add Spacemit K3 Machine
To: Zixin Wang <w1355457260@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Jeuk Kim <jeuk20.kim@samsung.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zixin,

On Wed, Nov 25, 2026 at 8:35=E2=80=AFPM Zixin Wang <w1355457260@gmail.com> =
wrote:
>
> Hi Anirudh,
>
> Thanks, that makes sense. I will hold my own model and focus on reviewing
> this series first; missing features and tests can be added after it is
> upstream.
>
> For the tests: I do not use tuxboot. The K3 SDK and image download entry
> point is SpacemiT's resource download center:
>
>   https://www.spacemit.com/community/resources-download
>
> K3 resources are available under the SDK and image sections there. My
> local test uses the K3 SDK Linux image and OpenSBI firmware from that
> SDK, together with a small initramfs and a QEMU-specific DTB. I pin the
> exact files with SHA-256 and boot them with:
>
>   -bios fw_dynamic.bin -kernel Image -initrd ... -dtb ...
>
> This avoids the tuxboot kernel/OpenSBI limitation entirely. The qtests do
> not need firmware; they run with:
>
>   -M k3-pico-itx -bios none
>
> The DTB I use is prepared for the Linux-first QEMU machine. If your memor=
y
> map differs, we can adapt the DTB and boot command to your machine model.
>
> For your NOR-flash test, the same K3 Image and DTB should be usable; you
> mainly need to prepare the NOR image/layout. I can share the
> qtest/functional test harness and help adapt it. I can also boot-test you=
r
> series with the K3 SDK images and provide a Tested-by tag if it passes.

I have written a functional test that test boots upstream linux v7.3.
I will include that when I send v2 (and some docs on how to boot linux
from u-boot). It loads in the kernel, dtb and initrd via -device
loader and uses booti in u-boot to boot into linux. You could also
build a UFS image containing linux and boot that (but I've kept the
test simple).

If you have any comments on v1 of this series, let me know.

>
> Thanks,
> Zixin

