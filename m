Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3749C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSW0-0001HA-3z; Thu, 27 Aug 2026 01:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSVx-0001GX-UA
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:19:02 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSVw-0005qA-5S
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:19:01 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-cc1b838f9b6so1518817a12.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787807938; cv=none;
 d=google.com; s=arc-20260327;
 b=Bc4KDRWxb3dxOvCGolxIsqS3E4TLTeb2R0rasvHRt8x1shKnbZG+iRyAmpauI/ibK6
 A6Z5NuYaDQxAlGoK8714wluaWJfnobENQU2aNxtUTgFIrfkJU83t/0y2f+mQ5owCOPlO
 dlbTRRHScCNP7AwfgYuqM++rxwUPan63jH2z89rXMMUagvYxRGGNj+PsGFWJgGOL/loM
 I7IJDezr7+ItDy5xxpsAic3DsGF1mKBaTXkSDL9rHwp1Gg3z+YIllljrTxxIOVFMQ2Rj
 aQYpgLSaMTjQX7u0i8T38bWKpa6MjN8BhQ4dattMvqJ1QDJbZWrQFD9dr3ftQxYQUAHw
 94EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BVjPHVNFtbbt4NMLfE0oYpeZ2wgFlY7nGKpNUYSowlk=;
 fh=nv6spKJeTtU6UsB7SrVCu9q/LN1d1AfHzdj0XsvR2E8=;
 b=byos6L+3Aso13VhCzIl/s6IgIh5UpVoJrgdgyLfc32szP9AA3w/eQ7kexD9HYsNNTU
 0SGt1EOleZKEHkgw3ERYcPLM4DXcV0I7y9ix6RzmS3sdB6SB5lhrTjkY263itbwodlWM
 EmtGkjM4kooBis4qxD80K05k1neynZWH7JPl5wLMe/p1q1SoVMzTElfs+OD8+mbPKDfM
 gjN9+RuIAcW9sZdGX66O/BmwqYK85gHReOuV7JwgNTO4hEBs8PXsVAqDAnaeU9mRjF5N
 cwTnMUwr4PyNPvlfVvAgmMHJjb6RPMewbw/i1Vgh8BTfR+IDlQRAg0DIgEjbs49OMGS4
 N3Vw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787807938; x=1788412738; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BVjPHVNFtbbt4NMLfE0oYpeZ2wgFlY7nGKpNUYSowlk=;
 b=VwT/6DNAI5993GowgSPNz2Oc/+L2MNEk/hLFZqNMqZ0I1azigfEJLZ3+xMv5jGD7SX
 6DYupqIvG32sFZflSfwVQppi9olTjHhxdTacxVP5QDJPBpVoOS89qpjSriYVh/f0LOwo
 OpT62mQh7qU7gvQmZIwSSE+1CJrQbtbfL8iqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807938; x=1788412738;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BVjPHVNFtbbt4NMLfE0oYpeZ2wgFlY7nGKpNUYSowlk=;
 b=o8VZBsMTGOFbf9vqKv2IEGoGNJ43sD58AVcIsctA9UsUruTEU2ynfSercjPeK2UBwC
 Wjm/1E5tPCoBLo7sv0JE5DTyf1c3QZEGwE4ZtSbWEhyPvqLV4t5bGKYYxIUj8TLvipcg
 rzeYLisIDp3un5imPbQCWu8L4UkESslwIFJocinaTGtyQGLFzDkGkbkcHoSeLkcGW7kO
 2Z6Vjjv4ZDmOg8tqZmJ+oInj2CMNKIumxh9OWQGvCoeYcNd9QrXFjK0oHh+VnFGFw/wM
 xCaYJP9f9kG9Ga0JeacuTi2nSrD0EMmHHmqcqpDUcMKiy/a9TGo0alMJP5OznKVG4dB9
 INfw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGn1A7nXwynJq2x1/TroQa/m91ellOF3Y0pSNKJ9xeSgRYn9Y/sT1RqRAwwCtO3UgZWSwOK5Dtxe4C@nongnu.org
X-Gm-Message-State: AFuF++n7DVzbEIEvBygXc1DPOCgMpIV3mmEch+m2WJqeZBY8RgSS3gUP
 mwg9MyHBg9fnTPDvQk788Xdp1AGpfObP6mQkX66ryBiTWQTaOV4V36VcrwQovbYcr8XTzL+99Ei
 AYxO32CkkMByt8lknFhdqVfDHQnQCuoA=
X-Gm-Gg: AR+sD10OQ1Dy/FfJE9WxqhiB5y2bsvOyd+OwE1cDQ2D0g1CpvsTDka/ZP/Ok53X2oHu
 EW8KZGSHPlu0Gpd3PQFteLbGuMzpWcHdQAh5SPRbsarKBCaUhn+CrvHX1NwkzIxqz6U8cMeIV0X
 wXHQ6WT9CEpk0DPR76aTKKGH6wI8bh5ask8JRpXlho3DupBNx2rkIYx1/a6xal0F8sS+EPQpUEs
 DY/hwlDgR3ewWS10HA9ZoTY3mFShrXJQ7asLWD+VD3SIKtvjPbsJHT9Nfakkz9HUmId317ArTAU
 B46FJzj0K44mhpNavpXdQl4POfLi9BTv66txQorMqczvEzdVEOMJxDQLN8n7nI3D1Ot00S52Igg
 Fz+HqgdVqpFQ13CDMEMy4IUq7iskQB9cdAD8VKWoczSeOJDhGNkiKMagac91cx5TWy5IML4t9nn
 QTL1U84hu3xTKz+Ed0
X-Received: by 2002:a05:6a21:e081:b0:3c4:3112:33 with SMTP id
 adf61e73a8af0-3cf75f83f45mr20380876637.6.1787807938324; Wed, 26 Aug 2026
 22:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260802113130.7818-1-nendensu@ispras.ru>
 <e350bfda-cd57-4b25-9c72-40585e30a488@tls.msk.ru>
 <a985157941bd10429a3048618e3fb977@ispras.ru>
In-Reply-To: <a985157941bd10429a3048618e3fb977@ispras.ru>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 14:48:46 +0930
X-Gm-Features: AcwNN1X23rdJ7vu-qDzyCNQTuwju6ArsSUxpre5apaty1dMCpUOCxPKP1b9Es0M
Message-ID: <CACPK8XfEQnEqQ923ag8kWXcvBNsxmUKZK_dCdUm-AddD2Mf0dg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv: Fix seed CSR sign extension
To: nendensu@ispras.ru
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, palmer@dabbelt.com, farosas@suse.de, 
 lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Thu, 27 Aug 2026 at 07:57, <nendensu@ispras.ru> wrote:
> > I'm picking this patch set for the currently active qemu stable
> > series (10.0 LTS, 11.0, 11.1).  However, it does not work on
> > 11.0.x already (it works ok on 11.1.x), the test fails:

> > Should I pick something else for 11.0 and 10.0 (on 10.0 it fails the
> > same way),
> > so the test succeeds, or should I drop this patch set from 11.1.x?
> >
> > Thanks,
> >
> > /mjt
> Thank you for testing. From my runs it seems that 10.0, 11.0 lack commit
> 569aa628 (target/riscv: tt-ascalon: Enable Zkr extension), which enables
> Zkr for tt-ascalon, so reading the seed triggers an assertion in
> csr_call. Apologies if I`m missing something here. I`m not sure which is
> better for stable: backporting 569aa628, or skipping the test patch.

Backporting 569aa628 seems reasonable to me.

Cheers,

Joel

