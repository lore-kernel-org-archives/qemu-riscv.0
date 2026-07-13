Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B97C44501
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 09:20:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjCph-0004qb-An; Mon, 13 Jul 2026 05:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wjCpd-0004n2-Da
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 05:20:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wjCpb-0000Bf-CF
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 05:20:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ced3386430so4558565ad.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783934405; x=1784539205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=szpUosI0Ux6fAvyTNgtgdyDheXrY/JuC0PaiDomHClU=;
 b=cPt2PkrXHUa540UZk5gCMkFe/MpOiQGZEGB8Poq98MyLOcDPe0gBAqWD9g4QBht6U+
 46DgasmDR7QvNtdpdKPjgVLxmQ9FeDWUfDgR1zXpBzV64u+E62Kz7xjFZ6zBYYuJcxEi
 MhV1rhb1oFgDGFOKlSM8LxzvFNBP5yhgB5YjnI/zcU0ubyZFLZ+06QLDwSvgM8f0J1SZ
 zlH7bfbkDcwHkbOO4qmJpmfBlrIRfqTHydr6nAV863ZAft+JwDChK2odkL541D862fV5
 4K3biE6u83W2V+9JTitW8DwuaFQFwVPGFMPjHER5TDsemq5J5+pR2o7MFBLZ+VVHVF/i
 y9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783934405; x=1784539205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=szpUosI0Ux6fAvyTNgtgdyDheXrY/JuC0PaiDomHClU=;
 b=CNF12Vca4hsbucyF6an8ZzvPU8OSqTMHTeooJbynLkOU0pb9lcoYFnhVeqajdAxNSs
 wXqq3g1EExwxv0RxYleCfZsJ+lC/oBoUBEIfKUbxmsXj2rPpfqkmv1D4UmHG9gUi4KRs
 VrTBto0+RSR1k6xIdhQxpM5dsEZ5vlkG1wFrDXVm2Pt90xcmhNfUE7jY8k7Xmhs98Fjx
 gITjjxiFmUONEXU0xxBYg0nAkYkbbTmiGiVDKyQk0QrXzaUsYJdjm6CBYMODavnDIEyX
 0GKwqgu9gLcU/ChQpoXGfF+ilX87LPAF7c/EiALXKdgmqknc1KZ8K0BcPnXxU8PEJf67
 jjNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrPIbOqPOAM3LyZ5OZstWMHkcFN+2QcmR+6v0YbPU8QLgmavlTjWCBry5BhZ1FWLK93Y+U1Xk+ilouB@nongnu.org
X-Gm-Message-State: AOJu0Yzjsrhl/rmTO1q0rmbH5lyQHRnsM1USXHOVQ7Q6/vAJHKQvpiSS
 ZWhU9/AAHkkHcdtBlzeSwhVRQwvm1F4F5GhcunP9BlDl/ppFH2YyBMTj
X-Gm-Gg: AfdE7cky6Ck3uVGiSLv7gG8Y/jBc2OB0LYhtJ2zr7PiF4GsscjhGrTAPbc/2WtMd0FS
 y+slvrVdoUAQBloB9SbNlCtQYnZKV4yMhVEcAxFUOy7fH7J+JEjf3T6gvxVsE04PVb0upcvy8Dv
 fwxfPaz9GqP0gyLMWmi1OWZ+PqOCnvkV7HyJwwt4URY/e0AwlRGRID7jmZaMtj51nyCaI0YR8bj
 ehDQcTeaWS+uLxGvQpTuXYXPB3H3b4AzouJQOnL8ztwX9JqZN4AKnCMKRfTeKh71Lran6xU9H3M
 4u5ZmTNs3WYuQBhUV/Y3eh2TcUrRYEp2tUzY5TP5lc9g7RZTuN+vFXNHYN87qTzF/VmH4idyWWY
 nw2wCd6M8ZncknnceoAeWkMZ3zvWtu3j9UuyqEsQqQBgH1wxIKVo83OiMXECpKCcWGpTG3dFQ57
 x8eNF1MlymTZZHuHmy03F0ml8+j+/zz55FbgcPlY5X
X-Received: by 2002:a17:903:32ce:b0:2c0:b6c7:2271 with SMTP id
 d9443c01a7336-2ce9e59ec18mr84764445ad.4.1783934404679; 
 Mon, 13 Jul 2026 02:20:04 -0700 (PDT)
Received: from LAPTOP-CS7CB8K1.localdomain
 ([2409:8900:98e:d38:2ced:eaa8:9646:31a3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bc1fsm96021445ad.55.2026.07.13.02.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 02:20:04 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Chao Liu <chao.liu@processmission.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH RFC 1/1] hw/riscv/k230: add IOMUX register block model
Date: Mon, 13 Jul 2026 17:19:04 +0800
Message-ID: <20260713091904.719480-1-flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4f853faa294e5005fe38b5f0a28a62032ac4f8d9.camel@wdc.com>
References: <4f853faa294e5005fe38b5f0a28a62032ac4f8d9.camel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Alistair and Chao,

Thank you both very much for the reviews and references.

I will split v2 into three patches: one adding the IOMUX device model,
one wiring it into the K230 SoC, and one adding the qtest coverage.

I will also remove the explicit offset, size, and alignment checks from
the read and write callbacks, since the MemoryRegion size and
MemoryRegionOps access constraints already enforce the valid MMIO range
and aligned 32-bit accesses.

For the currently modeled and tested use cases, the device only needs
register-backed storage. The SDK U-Boot pinctrl-single driver and the
SDK Linux IOMUX-related code paths I checked use 32-bit
read-modify-write accesses and require the configuration values to be
retained.

On real hardware, writing these registers changes the pin function and
electrical configuration. However, the current K230 machine does not
model physical pin routing or electrical characteristics, and I have
not found any additional register side effects required by the U-Boot
or Linux code paths I tested.

I will update v2 to follow the documented bit-level access permissions:
bit 31 (DI) is read-only, bits 30 through 14 are read-only reserved bits,
and bits 13 through 0 are read-write configuration fields. Guest writes
will use a 0x00003fff writable mask, so they cannot modify bit 31 or the
reserved bits. I will also add qtests covering writable fields,
read-only fields, reserved bits, and normal read-modify-write accesses.

The SoC memory map reserves a 0x800-byte window for the Main IOMUX, but
the documentation defines only 64 pin registers at offsets 0x00 through
0xfc. I will model only these documented registers in v2 and leave
offsets 0x100 through 0x7ff reserved/unimplemented.

I will include these changes in v2.

Thanks,
Kangjie



