Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FBB606A320
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 23:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQwEzJEF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUBwN-0008Gt-Q1; Thu, 19 Nov 2026 18:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1xUBwL-0008Gf-Oi
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 18:53:17 -0500
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1xUBwK-0001Yp-5r
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 18:53:17 -0500
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-1b3beeaf6f9so394850c88.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 15:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795132394; x=1795737194; darn=nongnu.org;
 h=date:content-transfer-encoding:content-type:references:in-reply-to
 :to:reply-to:subject:from:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4ue0Rza/ToDmfFE1elWBdtDYXgyuMe/LpzZtm/iw5r0=;
 b=wQwEzJEFbNO+/WqiUaK4CnaOkH1s6cjpfjw4/oHLXyZoNf/cgU7qGCAZTPa2RaOT/B
 onIIZ8hWY6kitc7pPKyl/jDn4fOwByKSNEQ9nrEiifAxY7qdcbHpB0f/u2GQHYMQWgPS
 Mt/5cKXy5JKaBzLmOAX4t4eRcWPpjYC4/c8BO/1lBwJv1w2BeW6yFLQaMI6bX303gE4I
 2YKrhV/HFkl1tyz1uXywcXHP8eYMtOKnfQAqh5vAGbnBNwnBj2U6t17bP9Bi7YKULYHc
 mJ65yuLhHRlP97fkTXLiKcBN9Xk0zVitVHYCiYYRcFbh86ojK20VvaowM7OX50xoNix6
 UiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795132394; x=1795737194;
 h=date:content-transfer-encoding:content-type:references:in-reply-to
 :to:reply-to:subject:from:message-id:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4ue0Rza/ToDmfFE1elWBdtDYXgyuMe/LpzZtm/iw5r0=;
 b=l2NzHF+4WVpTPihkZ3Ojalf9xziZTOU+EJCIl902oDouwImovu7YWrA7H1OdaU7nK/
 +wC9lqC1r3XqOp2RVa/YMqO6KD5M5JpOyeU/Mw6On/hwkzcS3mmVgd+4muhlxj9EJOId
 wBmZCeXy23oXK76bzvT29S89dv3qq6RwcKcgK3XQ38B6H/JKWjvrQrq8uKRj5h1Nml7m
 q8NIDEqT5EbKSkm9yMAiQPMp2JRWzRGUexdh947VAPv0V1iPz6j3b2d7R5NyoPEQ4pnp
 QqeM4u/pfk8CgGcB05FOR8R73u11z00wUQEwTArGp27rpDLlRAC1VuL7KqaG0VfVOWc9
 jEdA==
X-Gm-Message-State: APuU4Z9inLCltl4iwn5ZcA/QKtUsK2H+uYWTwsAWHbxSXklqlh3RCEOU
 n44uHraMFNvCIi6fm5L18lZfqAmZJO7mXgWrerMHOLBm/eT1ZulTkEz8NocrhnR9
X-Gm-Gg: AYBFou29+uSGX0nkXcL6MyfaPk7u2+S509dynybu5evHw9DDFa848b7fHVDcTG57QST
 +M5QZ2Q+AXwajMq678CKXwTYa3o1v+OOqmFyS/zSqq3qLXCsYw7jorasATCdQEkXkJRgCY7ee9R
 yVTUt/pj5nGQMUCZx4McUehWnWAQUCOTfAroBVLm5jnxtRWetEwyAAS36EVfYQ8Ywvult9pyA6u
 Xqg5yqscuzzoPPxy3m4TSfTe+Rsydc/Gx4Mvt2Q1OwK804VGgtmgYV78y41wBPYZxvBVSAaw678
 vOe//OidQmL8ZCc02qxNdLDBFE5JKK/SjazGSRlPev5DDYolFyY/unAXCntNLB0U8junwmfNoCN
 rH7Lc5N/EPFeJweq4CcMS89/VqEmi4KzC5F2PpvwgDXYX5ehDcMipMLqokj1WYs4iyCVXncnH9j
 wGKCBKbXF1IpN1pWvEbmCOebA2xVwHyoUtI49vvhHEmyK1UGe01OwcIppK3eLQqGUWRKIHgaymD
 WxjL06aE9M/0TCR+Wjo/lo9uYBvw5jOn3/xyCcNWVCVeiLrm5gAziAgf3rBbbXafC6E/+nj64FD
 Oc1CtDhF+iYD7fwhEDnTT84=
X-Received: by 2002:a05:7022:b051:20b0:185:b157:f271 with SMTP id
 a92af1059eb24-1b5568e30b9mr1253926c88.23.1795132393951; 
 Thu, 19 Nov 2026 15:53:13 -0800 (PST)
Received: from toolbx ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b5568592adsm2120813c88.15.2026.11.19.15.53.11
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 15:53:13 -0800 (PST)
Message-ID: <sashiko-outbox-255@gmail.com>
From: alistair23@gmail.com
Subject: Re: [PATCH v1 1/2] target/riscv: Write zero into mtinst/htinst for
 SSAMOSWAP faults
To: "Alvin Chang via" <qemu-riscv@nongnu.org>
In-Reply-To: <20261117132638.1452474-2-alvinga@andestech.com>
References: <20261117132638.1452474-1-alvinga@andestech.com>
 <20261117132638.1452474-2-alvinga@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:53:09 +0000
Received-SPF: pass client-ip=2607:f8b0:4864:20::1229;
 envelope-from=alistair23@gmail.com; helo=mail-dl1-x1229.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: alistair.francis@wdc.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] target/riscv: Missing Fixes: trailer for bug fix
--

- [LOW] target/riscv: Missing Fixes: trailer for bug fix. The commit
  fixes a bug introduced in f06bfe3dc38c ("target/riscv: implement
  zicfiss instructions"). Add a Fixes: trailer for commit hygiene.

--=20
Sashiko AI review =C2=B7 https://risc6-threadripper.alistair23.me/#/patchse=
t/20261117132638.1452474-1-alvinga@andestech.com?part=3D1

