Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7651C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 03:56:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGMu-0002xd-7g; Thu, 20 Aug 2026 23:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wxGMp-0002wl-3o
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 23:56:32 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wxGMm-0002H6-92
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 23:56:30 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66c7e3a2332so391600d50.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787284586; cv=none;
 d=google.com; s=arc-20260327;
 b=GRZ7s3Fbuz5fGsgDmRABDFOptj/y7TVOdEtuut8APT/2YL/s5XrZhW+LxGEdJlWBU6
 7QHALLq6teEWi0PZB98V/HvXGmoOFaGP1Ef2jlE217FpGfpbgQ1Xl02tLcnJCx+izV+l
 FISnlK8zHQTFiprv5nuVRa1PDFUZ8dX7zC29lG25loDm194tRl2bTAXDbFqzSHk5+rzQ
 oQzGp1oXaBb+Iautez70on23Hh1Qag4qC5QM6OAvkq6lm84vVujw72edwGPrIQzRx6yS
 2uJpGVRnlxQU+3WDB9z+K17MwIg/RCIpz4qCTLhOrFbgwO+pO397/7knPkjBltsePvzC
 OkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=e0/NANrCXjOobJNFshmIrntAvuqdQUXlvIojefKohd0=;
 fh=2JpraIqsWgN509zSMwDzhnhRp01KzEqPMpX5x46PMDI=;
 b=TfHYPhkcQSKqX+QT90jVVCFuxVN4xbf/5iDwQK/1DsPADdagEjGQ05b0hOTRndBVOe
 8cN4/ye7RC1f+lwEOzN04Jx8qaO4up/Hj04fJHx6oDmL8RtISYgl8vyxN/OS1/X2i9NO
 wv4uaxdbjElpHO9YpzzEpAL+EikOXLn5JwsvL3qrQn42tMcF7gZDmjxhb87+EACfvywt
 OURRp54SLMWNHaSXom+CitBaH15Kdpsf5Z8CY7KVF/S1Llk8DOdxCOyqVk1v5OMIM+pk
 ZXNvfuVAmQhc4vUr05lsBusK5XtY2fH/+klzPPeW35gUIaSkErlDji36MzUo8+Ne5QMc
 ch9A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787284586; x=1787889386; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=e0/NANrCXjOobJNFshmIrntAvuqdQUXlvIojefKohd0=;
 b=WBFEalX/t6YVe/wyvwn+Y6D7LeSE1HVlKm4GOiZEterdgzYKmIWsB0Z1fHUrePBqos
 DbVXFRoVuZj2OWNXxQ5AX0xpkiHwjw3rBrSUZVd80FTGbsY8BROlzcREpxHN5PhAImNb
 zKWDJ+Eas9+lVhmMJm7stcADzHqaUq5zdhbNpYmWIOUkNHk3fsHGTdOGKtnAsbfBVz6v
 6CR7rjL+9+sCtTTslc/x3C+olFu++t4u70hl4Zfgdig3M7sjhX8UF3UQEC7O12gtDt1T
 ZR2uFORB+lMTF8k2gZ4p0xCQ82dTrFoxZp9I0p9qCAJQGOFkF/kVFndX28aq26x2d/gI
 NhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787284586; x=1787889386;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=e0/NANrCXjOobJNFshmIrntAvuqdQUXlvIojefKohd0=;
 b=WL8NlEtp5u/FqGmuZhs642GLwHr1TGs1ksoYPq6wgYQmv5pDTuKiSs1FnVD9zwtM4G
 4g9qqNTL3GFoFCmN45CZFhRF5pE99AVB28VjPNyw3idFN3mYkxlHBgBazxLtqmGhwk1r
 mOfNt1HyiGTF8cbfnbekcjclHS0+Lwkfj6wBSwFkyBanSvg9eedtHB7pxF0jxESgMRsF
 n5LKrB7wdPrCf9g1266ImU+eXe8pgIaJwnSXsDwmi2ZdEj+LsMaeRxy6mJjiI026RweK
 7YkpiWUR6cLB80o7VB77pUBn3el7sb1h0aP567OQyYl6qqHHAcm6tejjYTSfhgG16WIv
 M5Eg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPSndv3GiW5eDx/mGIv2p1PCAAHmaOLJRBHZjZeojhGHxOjeNmD/El0+/ca+z5gF08cGKGU0ehwSDa@nongnu.org
X-Gm-Message-State: AFuF++lGxbQh0Cs69awc9vA+OllN3J5pdIMZwmkyy1imqragS2Zb5qKG
 lHKMguZhYEX9o5CEByb4GXXEIOr1v2oS2X8rTFIJzjR7PAGhzBoiADgaSziev8j2OfulNb8WpaQ
 a6TdSTA+03b7hIV7Or/S2MabEC6HHM4M=
X-Gm-Gg: AR+sD11Sh44ug8s5n3R9vUxpijUi5BK4xxpb0Aq+t30iJWRR7w6VH7MV//FoMqR/VGB
 uhy6B27lRGQzPh05Ph+kQwiwitYkcfYtoWNwcplN5Fvsilqsl+MZsWE7BKvx+/E8FUJtYuqExoc
 b2l4OJfaD2rWBUnlwxkIPDw33qA7TrZdVTGF2EFGOQCxLz83VbZldhpsd/TBveJm1Fe5bN+RCvr
 1JUQIcEyyFVepuhGM8quWBgnkdtS2RYL70cZpljG1yTx+etSMyrzd74KW8fm0OjB4xz8nwDg9N0
 WZlXddlGSttAR+3HmvVNUFN/tMjQL+2M3Ji4zCk7Jwk/
X-Received: by 2002:a05:690e:bc1:b0:66c:c7e4:2ff1 with SMTP id
 956f58d0204a3-66ce4a1073bmr1416660d50.15.1787284586003; Thu, 20 Aug 2026
 20:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
 <20260808182956.290561-2-flamboyant.h.01@gmail.com>
 <3ed04624-9d4c-4c11-9d7b-4bb6568b2590@oss.tenstorrent.com>
In-Reply-To: <3ed04624-9d4c-4c11-9d7b-4bb6568b2590@oss.tenstorrent.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Fri, 21 Aug 2026 11:56:16 +0800
X-Gm-Features: AcwNN1VE8RqSaOzsXzdPQvs6snSJSbnbVG7PiMoAjPTtDXkWyRjt2mRuWNbYDTI
Message-ID: <CAAW0U4Z4hSpbC62xE78PJjJPQKNh+7XxF3-Q14QzymELedxhSg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/ssi: Add Synopsys DWC SSI standard PIO
 controller
To: Portia Stephens <portias@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, Chao Liu <chao.liu@processmission.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yx1-xb136.google.com
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

Portia Stephens <portias@oss.tenstorrent.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=BA=94 09:11=E5=86=99=E9=81=93=EF=BC=9A
>
> I don't think this will work for frame !=3D  8-bit with the m25p80 flash
> model used by k230. ssi_transfer() takes a 32-bit value but it then
> calls m25p80_transfer8() which will just transfer the bottom 8-bits and
> drop the rest.
>
> I don't know if this is an issue with your code or with the ssi_transfer
> function though. It seems like ssi_transfer intends to accept 32-bit
> values.
>
Hi Portia,

Thanks for the review.

On SPI_FRF: you are right, the explicit clearing in dw_ssi_write() is
redundant because dw_ssi_write_masked() already drops the bits that are
not in the writable mask. I will remove it and add a LOG_UNIMP warning
when a non-zero SPI_FRF value is written.

On the frame width: ssi_transfer() takes a uint32_t word. The issue is
that the DWC model uses CTRLR0.DFS (4..32 bits) to define each
transmitted frame, while SPI NOR is an 8-bit consumer, so the two are
aligned only when DFS is 8. The K230 SDK SPI-NOR paths use 8-bit
frames, so this case is not exposed by the current K230 use case.
Maybe either add a DFS !=3D 8 restriction with a LOG_UNIMP warning, or
have the DWC model split byte-aligned 16/24/32-bit frames into
multiple 8-bit ssi_transfer() calls=EF=BC=9F

Thanks,
Kangjie

