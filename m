Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251BB606A326
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 17:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CjOH6b2I
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xU5fR-0006op-TW; Thu, 19 Nov 2026 12:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xU5fN-0006oH-P9
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 12:11:23 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xU5fJ-0004bL-Pv
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 12:11:20 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-679a2b5fe87so41600d50.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 09:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108275; cv=none;
 d=google.com; s=arc-20260327;
 b=UgIE6baN8fdw4rTUP9jB0hKcQR2nZyDSTqPxzwGpbU49xqkhUdDhpOxcRKL7e6xkkx
 L3KewC3gJOP6/XEgadgUwoGrQcXz0tZ9wmBj3EPHhWWFTtIb9ldfwMzJ/o8XFUutdt4r
 Ax47rh0JP2PnC+MeT9rYbkV0PG2CaOSJX/y+8YXzdUyeT8AMiaOgSVl4TNsf+CkPKkk8
 z8ZoBL7YVrtDEXgHF0Khae8q24nmv3nUIFiE6Z7YVszo+c9TdnmiUobJoCxhRrXOIddW
 FV7b9m6DjMrbMftdBaEosGNwzAEYA+uTPOX09jzRpqCD0nyx4XPtM+NW80kL4CZPVvhq
 I5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sDLycmFM10VSeCwpRcCL/BHbk3esIzsonr7meP81oXE=;
 fh=rSj8zScvgY2Qsy5VBr4KsVRxTZvYgDpQQ+6b+8K7+74=;
 b=Boc/Xc4kcSnpxfgia9Qbnuuje1PuMFazSP0qQC7ryrXXOL9f6FtLcFrJ/fcJjiDLgR
 v5GZzJZgfxJVNTXeGXolJ8XvwmwxXDsmmHWF1AqFwuI5s3zoZFIawfG90y7An/suR6mQ
 1PMa6RCsTIK58IcmCQs6mNq4o/+3kY+flf1YWh2Sh3kasLMsXe8pBC844z4WVB5IKmKm
 PS1TVJN03rgmz/kp7wBxLqGhGQ4LCW3YbK0irCMdDRsqQ5b+EoL9pJmSdfeH0iq/U7V/
 ynk6ZPqYl27fbX69CkPdxQ5SuJfO7W70lEAPOtcE7R7MhrXDymEjxnZ2RnZRHeapUp5g
 EHCQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795108275; x=1795713075; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sDLycmFM10VSeCwpRcCL/BHbk3esIzsonr7meP81oXE=;
 b=CjOH6b2Ib6vfxZilYs115+C3GddhfE05pWlMdThc78jueM5Vi3Ka55ESP9PJaSepdA
 FuK+vTbdTTKpIQ+hE40GOdfyRIdTbCMQLqJy8Ix7v1kws7HNSdRrnZreo45bvzWkgqZm
 SvLJt2peuX7wUwkYNAzfUtfmSE0v5byEUwEtS+44aYiL2+ps7TEKpXL3REPHgUYxUhWO
 Hom97PLpKfDwUWpSaTlr8mCIyhyqug1tiGZF9uM+VTQs6BNg8VTpcgDopzqb/DWYD70/
 S6zSfPse/isCHVHFwyLxx0s81l5os4kpc0ykVJ/ifNQhJ2pFiAj7Y+86yUcd2gDa6qKj
 g3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795108275; x=1795713075;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sDLycmFM10VSeCwpRcCL/BHbk3esIzsonr7meP81oXE=;
 b=kuDLwM9HvD2co6dtAf0mWCBVSVKMH2rPS3TDGN1YirINjcsxfiJSG/9OrsDwqQko94
 6FcLCcyXEHYBqJpIwwQEetY9mVtwEWKFqN17Ngwr8VKZtLT39BGAqdghqlzzE45KeqQ6
 ol3IS58ve00x0qtxaJzhzxpCQUDudozc7Wsiavr1ECg+dX2jZj1rS45e1kFZOY1lnnPo
 IZ78e4ptHROBp/9jNbGdk1QPTkfGY2BnFstOrO+ZBdghOvfMjkCp1VWb8HToAogIWZBi
 50eRpS7XYaT+SPNvyL80iX4fYDZokTX24Cx0391ha40oej54kRDxWduTEexBZ+XKUGCa
 MmEw==
X-Forwarded-Encrypted: i=1;
 AL+hErHu0mO/x7wIvL7riwB+GFM81tnilJM0JUdQBCwagSCZiLvSl+f+4hpuCM7wvk7p6SMdxd6HqGjzuB2E@nongnu.org
X-Gm-Message-State: APuU4Z/9r47BnTfjJQE1J0xJZ7cnDQmiPP0KAs8vyyvIOCdt/k8jdjwn
 Py0XB7xmwmUUHkh8Pf5PbbYmAYys2weBg7nEbaFjXr2ahDJ107PhL9oH1ta/QTJsshf3flZePWt
 6VWL5cWjQfEBiJZU+PAT9vRl1hB9Rxa7Ph1cNlGrwvQ==
X-Gm-Gg: AZFdTZdj2iQUK6RNH2cimSt0CzkCBjl0xqliGhhLvYCKaE/OI0ODOsAU1JY4ELSDyQL
 guXcsTPUeOVJz/80jduWNUlv6gRMkX4cJ9nlgikG72dTN9+C+25mzcV5WxFX8yJZNTwjeElNptc
 KPhMEtoI4lyzEIpm0qw9+sIpfCcpV18hpfE91QrHZYCW0azES3i+U5cxnX2D83zlwC6WbkVtXjT
 jwWYAUcw98eStMbe34k4HLzzaR8f3RFlb2NT5uCW4Dh9oAh8WaCSJgiPUHOw5wqG1iSK3RyTTaa
 x9tA23P2CpSgAt71CK4CfbuIB2wC2k53sjE2M/+MdARL/2GJmohMUDdpDsq0lElJDOYkQkY74ET
 zKOj7LEdgH9G+O/Zbs9VRlbM1+wNjuqZX+bWFEOn5Xb2jGFeyfSBlJXCCzHe7Yxx3VZJB95+A6q
 3/yP9neNrlfW/7yAZ7+CBaxA==
X-Received: by 2002:a53:d005:0:b0:67c:8ea:be19 with SMTP id
 956f58d0204a3-67df44c20c3mr35681d50.104.1795108275291; Thu, 19 Nov 2026
 09:11:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165716.130978-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20261119165716.130978-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2026 17:11:02 +0000
X-Gm-Features: AclHuK-REbMp--VetPzEmoMK1BmQphHK9BF0kgPDPnwxqTrmzqVn_nSAMP45k-k
Message-ID: <CAFEAcA9FnuWKkHmV4dxv2Nnp=MehSXijKPcB=cc5czB-3XgoXA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] target/riscv: Correct undefined behaviors in
 x-rv128
To: frederic.petrot@univ-grenoble-alpes.fr
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 daniel.barboza@oss.qualcomm.com, palmer@dabbelt.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 at 16:57, <frederic.petrot@univ-grenoble-alpes.fr> wrot=
e:
>
> From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>
>
> Peter reported undefined behaviors in x-rv128 pmp configuration
> registers accesses detected by the clang sanitizer.
> This series introduces a 128-bit version of these accesses, and
> corrects other out-of-bound shifts within the handling of interrupts
> that were triggered afterwards.

I would really like some fix in this area for 11.2, please,
because this is I think the only place where a sanitizer
build falls over in "make check" / "make check-functional".
I don't particularly care if it's the full fix or just a
hack to avoid the immediate out of bound shift.

thanks
-- PMM

