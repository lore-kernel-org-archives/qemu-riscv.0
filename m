Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEFFCCA476
	for <qemu-riscv@archiver.kernel.org>; Sat,  4 Oct 2025 20:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v58Ra-00014N-Vg; Sat, 04 Oct 2025 16:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v58RO-0000wz-Rd
 for qemu-riscv@nongnu.org; Sat, 04 Oct 2025 16:01:15 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v58RL-0006E4-9R
 for qemu-riscv@nongnu.org; Sat, 04 Oct 2025 16:01:14 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-27edcbcd158so45045705ad.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Oct 2025 13:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759608066; x=1760212866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyUMAKAMMzxzjBFdIg7etB3CpnVzv30SqV4s7/yn2ic=;
 b=ff4iOuavI+aMAQoF3s1ylC7cHH1Lp4rSASSnEGubqeC8MWOFRuYTLf3CiXf99ze0Ae
 Mw0LKR8cLGlFVgIsW+yVDV2eDgbg7qf2kZf+0+7Oq4MYA+I+9gjOY3a/zqHk2PW5WSu5
 OP+PURNjFyivjkGAyuuIr+nG/QwEYkmOJCxyg2gPSd9bpvE50wS4TZA/mzcFK0GpLPpj
 kPKlAUD/Giacz+c0sm6DbdP+pbV6ClWxH7VCHAmjBiOXifFz0MK5EycjLRl/HtuPxI+8
 88c1IsQU9CrxeC8NCrHKu3G/s2KW2aMN3LTaWs9JOhS02GFHN24X1dxaKyA3+Dp2f/ud
 E64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759608066; x=1760212866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dyUMAKAMMzxzjBFdIg7etB3CpnVzv30SqV4s7/yn2ic=;
 b=IChZNTIjgrJ/gHt2f1BmPMwjXmLOFabowGFd15c5/tkNVSFgOUIhd4BuA2uY5cz9RS
 lYCEc67puQM4pppxnILF5SNy/dCTj6oRASJaI2MrU7vZIZps/7hq6hy9c0kcZ5RVruAG
 AfBUClhyvSddUMOxnIiWQW9YcRmvbIH+w8m3bzWfMCfpaaoGKSUh03pUzsTaEA8vvkP4
 rNeBHcWK1PuXXUOk2emw+QC2bocM01H0otSSs321Ph1YM/ivFiWAS/jwqYDHw9oMCV8g
 GynhVrRNO0p9JkTOIBzEKCZNqBFKyIEV0TwtbX02+AmO36nNDjOUxgm96T0pfNINRXnS
 1ufg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXDvOLUyIj0bE6dozO26oIoAAWNI1bj8IeCLNygt5oXAXRbRPwXcvfu1gBsSrh63U+TN+ZqINIWC/z@nongnu.org
X-Gm-Message-State: AOJu0YwkorLc9r19BvYP44faLHO7ur2qFdYNNlqt//Kpdd0Fdyj3Zea6
 0WJRN/a4nr915jT2RjHTsJF21nYGNAot00UbIFDq6gZxQCMZNwNu9YlH
X-Gm-Gg: ASbGnctSViATm3jU8rOqyJ+cmdeWJL/f8BGSebmuggHmSEZIVXAoH0CF+FqgypP9CwS
 kBj6XYg7qTTVBvt2S6Pb8afVDwcjyVBgBeAAuniQZ3n8F5eXFgvDIV089RX/xr/HsvGpROsOUYZ
 QMD7qjFd8SI3An7M3wZgH+jRfZm8GqPdoYxhNGY/r4H0e8acjxzEdD4/HXPfz3aq/Bj/+6DB9AI
 oO7uBDT1ebB0oeU+QGhsPMjMW9KxW9gYkVKFS2oLXqfxC/9/+a6cHn+CtNL9YL8+nQQePoJQdLF
 xOdDWXN/oxsTy5Fl7b2xwqOkZ2FRvt2imNVGYK+oHL2CcgJpJw7aqSNPgBhVi/skbgp8N/9LJYj
 tiaEXh3sm78Dm2/D6Z5nH3mAHhYqEPkKtfY+6QccpCbNG4PaLfQciNf85HdsRZ0HJoqvg4w==
X-Google-Smtp-Source: AGHT+IF4GLh/DEwGXvo9nnOljFzhXZzDwwKhHqMjw9WeWrpp+4F8ir1DPNGb4u+yhaR9ZykCQQqMsA==
X-Received: by 2002:a17:903:2f84:b0:27e:dc53:d239 with SMTP id
 d9443c01a7336-28e9a5f7230mr83878455ad.35.1759608066171; 
 Sat, 04 Oct 2025 13:01:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1260cfsm86141925ad.48.2025.10.04.13.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 13:01:05 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] microchip icicle: Enable PCS on Cadence Ethernet
Date: Sat,  4 Oct 2025 13:00:49 -0700
Message-ID: <20251004200049.871646-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251004200049.871646-1-linux@roeck-us.net>
References: <20251004200049.871646-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

PCS needs to be enabled for SGMII to be supported by the Linux kernel.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/riscv/microchip_pfsoc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 6e2a6e721b..5d3007e8d3 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -415,6 +415,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
     object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
     object_property_set_bool(OBJECT(&s->gem0), "phy-connected", false, errp);
+    object_property_set_bool(OBJECT(&s->gem0), "pcs-enabled", true, errp);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem0), 0,
@@ -426,6 +427,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->gem1), "phy-addr", 9, errp);
     object_property_set_link(OBJECT(&s->gem1), "phy-consumer",
                              OBJECT(&s->gem0), errp);
+    object_property_set_bool(OBJECT(&s->gem1), "pcs-enabled", true, errp);
     sysbus_realize(SYS_BUS_DEVICE(&s->gem1), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem1), 0,
                     memmap[MICROCHIP_PFSOC_GEM1].base);
-- 
2.45.2


