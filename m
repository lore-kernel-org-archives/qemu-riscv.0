Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1B5C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFEv-00088A-W2; Tue, 08 Jul 2025 16:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDyi-0007VD-Qa
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:27:53 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDyg-0002T4-Ja
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:27:44 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-408d14c7e92so3522636b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002861; x=1752607661; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tta5Mdv0u4HyunTJLNPVqLhMBNwh/iE+JErBOo/o8Yc=;
 b=xXt2IszdrsgVzsIuFcj49YQd1sbLAvrKLjiT+h74TlU6mdDNAm55+Z19O8tdiu9irU
 +bnbLUae/onEm/LlJlfMe9MMOZVQe/O0fXRvSsOm279UfXOGz+6b4x+MJsQYcAwvjx/3
 +8cw3zA9cZrMlk5rM43F/SwKjPE1l6ixz2vEK4pXxgDqRyjRfVkrZH6+lJSMI4ID4zFu
 p7MZk4Z4glEd1ezDqWpYlUHtrj9VYu8neMwUiLBq47m9JDWvJI3ty0pzmLSKWKME5ac4
 97ar+wSCD0Uib/BCFPkiC+XnZ5FWMMtCnI4/+sVGFNFrh8lwoZMm7PBT5cBXSVHY1IMC
 3Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002861; x=1752607661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tta5Mdv0u4HyunTJLNPVqLhMBNwh/iE+JErBOo/o8Yc=;
 b=G90wMJwH1xjFXuCRoSJWN/irgtCyG0yzdmSr17vhSIuZUUag3o8b6nNPzy+CZlteZI
 6olJin2ZdUPQK5now8b7ARNaTbbRl9UG+t1HWfeigBlUs5TdvgF28uChH1ugSncM1UWw
 ZFyQknGhxJpTDAIzAj/B43ZoGtOqrCBm70NVRf8Pd6CrPRRasOeZIlT6FaZ2HOIRCyWa
 mk2QbEv1/N/4AM4QXR8ehtIlAMOzP7gCRNs34WjDqPO7waC/4hwTvFPraOS9+XElgqMI
 8TmuJw+2amFjlTLxAz5qoVUrNweUJCA41/OJcJkJM90Ly1s3FERcPLBWzhjlaznuidMP
 /+3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx8zHKw3FhDBxzDL84cGjoe3mDgh/GvynsPndpcI9E6JK/xrbd+SgpHgDmeiwd1ugVu+4D0y4mlQPO@nongnu.org
X-Gm-Message-State: AOJu0YwJJ6V/fQn0mnAd6MnPCPdZrQVTtoJ4w4XxzFnEi3KFN+Yto3PF
 FeDxlyROHq86C8m2eapEvJ8TrZTLf9Ti2Dc0AUF4vOCxZ2Xjx+Cea/H66fWX7qg9kt5Fo7+HHV+
 IbADI
X-Gm-Gg: ASbGncsANt2ZIl2y642wN6zbiazFh5+qbU5cNFBrS9g/dD0y9FZa2RH4vypLlnG5eDN
 9QxtczxEjgcD3qF11XJGIQoU3drdQuag1cJyXqFYw3YUrUww7nqeen06MoDomSelqBXZCra1LdX
 aIlPWPsUVdcsA6a1XkQFc6pQEYPjkxp9nerLkjOxsz331m57xh4Vd7Xvgve7kDcm3LGLDFKf1Ys
 NE8Pa45S6BcW2D6gcsBfNo2ai6KyR3/CaLyddoHykby2BMWQ1uXHnD7OUJDwokxkmbQQO3YhYKV
 Sx0QlS9lEYXc7wdSAw2x66SdTDBdxGIHxhoxg368Yed0p4RzcDOLSrgdRXR1Z4XzIvWf7S+KOUA
 =
X-Google-Smtp-Source: AGHT+IGzGrv5wUVsy6z+dn1Bx5Y2gV1AqOR0Neyx1aJCMXa8JqNaYvtMeYEI5OcqDHRG/gCYni+m8g==
X-Received: by 2002:a17:902:f644:b0:234:d399:f948 with SMTP id
 d9443c01a7336-23c875428a0mr219465405ad.33.1751996129198; 
 Tue, 08 Jul 2025 10:35:29 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459c6e5sm122901325ad.227.2025.07.08.10.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:35:28 -0700 (PDT)
Message-ID: <c7af688f-6400-464a-b6ee-f5ae99d827a1@linaro.org>
Date: Tue, 8 Jul 2025 10:35:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 7/8] qemu: Declare all load/store helper in
 'qemu/bswap.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Helge Deller <deller@gmx.de>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>, Bernhard Beschow <shentey@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Xu <peterx@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-oi1-x22c.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Restrict "exec/tswap.h" to the tswap*() methods,
> move the load/store helpers with the other ones
> declared in "qemu/bswap.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/tswap.h                 | 70 --------------------------
>   include/qemu/bswap.h                 | 73 ++++++++++++++++++++++++++++
>   include/system/memory.h              |  1 -
>   include/user/abitypes.h              |  1 -
>   target/ppc/mmu-hash64.h              |  2 -
>   hw/acpi/bios-linker-loader.c         |  2 -
>   hw/arm/allwinner-r40.c               |  1 -
>   hw/arm/boot.c                        |  2 +
>   hw/arm/npcm7xx.c                     |  2 +-
>   hw/block/hd-geometry.c               |  1 -
>   hw/char/riscv_htif.c                 |  1 -
>   hw/cxl/cxl-events.c                  |  2 -
>   hw/display/artist.c                  |  1 +
>   hw/display/ati.c                     |  1 +
>   hw/net/can/ctucan_core.c             |  1 -
>   hw/net/lan9118.c                     |  1 +
>   hw/net/rtl8139.c                     |  1 +
>   hw/net/vmxnet3.c                     |  1 -
>   hw/pci-host/gt64120.c                |  1 +
>   hw/pci-host/pnv_phb3.c               |  1 +
>   hw/pci-host/pnv_phb4.c               |  1 +
>   hw/pci-host/ppce500.c                |  1 -
>   hw/pci-host/sh_pci.c                 |  1 -
>   hw/s390x/s390-pci-inst.c             |  1 +
>   hw/sensor/lsm303dlhc_mag.c           |  1 -
>   hw/smbios/smbios.c                   |  1 +
>   hw/vfio/migration-multifd.c          |  1 -
>   hw/virtio/virtio-pci.c               |  1 +
>   hw/vmapple/virtio-blk.c              |  1 -
>   target/arm/cpu.c                     |  1 -
>   target/i386/tcg/system/excp_helper.c |  1 -
>   target/i386/xsave_helper.c           |  1 -
>   target/riscv/vector_helper.c         |  1 -
>   tests/tcg/plugins/mem.c              |  1 +
>   34 files changed, 87 insertions(+), 93 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


