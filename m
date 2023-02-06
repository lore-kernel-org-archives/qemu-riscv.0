Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPAh5-0002hW-Sq
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 18:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPAh4-0002hJ-Cc; Mon, 06 Feb 2023 18:14:38 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPAh2-0002VY-Lj; Mon, 06 Feb 2023 18:14:38 -0500
Received: by mail-ed1-x52a.google.com with SMTP id q19so13306626edd.2;
 Mon, 06 Feb 2023 15:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ngiEMXaS35d3mnB3bo/M5KdP1MctJ4Wodp21fE0vZc=;
 b=OguZRuxdI247Tg5UrDPvM5EgwPuDxGW0nPeP6ChW7cClhcDSKMI52pcCayk5sm8FxP
 QyaZM4QHoGgOzRmXoGPTFk3nOPXsqX6wynfnvKCQfePNKP6ppt6A5csKLsiTQ8KC5wSn
 HSgMFG8Ns/qV+eV3ytoHPRgax5mdOpUlT2An2UGIqES/Du36VCG2WmtR54GyEM9p0dwP
 vQS5/0cDU1SAm7unki9rBsciNl+8BbyhX9EqDU9Mm4UjbuJt1SXLnhQMKp0tcPla1DbI
 bskcoLHlsbZg3lEux/SN7JNY31vENN5jOzUKTg7lAaHxs5WlU24geI/YMSdpBJDvb7d2
 rUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ngiEMXaS35d3mnB3bo/M5KdP1MctJ4Wodp21fE0vZc=;
 b=QadrmcmZxj7GdM0ozcZoGV2RtfqcbGCPHA5ygZa0wadTJX8IcvIbLwZKtF/DqwWmt1
 7y8J4uIRk/3qUWBOyxYsvH35SAcFNt5H/2hf6A2fJTYL2TBrUOFNk6NmhM4bdRnzY/As
 teRB3b+BGSCobgPvuWDY2ko4U/aLmbQaZ27sRDlETaXnN8RTXO2ntTPNVBU6TYXqxgDA
 BI2HC8OHG+M2SIZry+CfUfbemHM0vu9myNJYNBHC6vOWR+ioFI4uMrRYBqPXfrfMjMW8
 4nnjF88gqndRchtBt9yBwfaCxCc6TQce88X3AN0lIwjTmFo54n1r+vfYemnC6BRX42FJ
 /Opw==
X-Gm-Message-State: AO0yUKX/FxrFQUYAuFEO0390fsGiM+W2HVMbspHVl41XOLPRMlAk+mAJ
 6txLDgJe4tufKFGLrOYmPSU=
X-Google-Smtp-Source: AK7set+PUCXKMew/Gw29Ihb13n1wK9ex5D1Si1VKS5NhdBRynjEnJ0NDNvyFEkMlGTeXDl1gOap1ig==
X-Received: by 2002:a50:9e0f:0:b0:4a2:1263:bbab with SMTP id
 z15-20020a509e0f000000b004a21263bbabmr1306897ede.17.1675725274318; 
 Mon, 06 Feb 2023 15:14:34 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-247-108.77.191.pool.telefonica.de.
 [77.191.247.108]) by smtp.gmail.com with ESMTPSA id
 b9-20020a0564021f0900b004a21304f5a0sm5659145edb.72.2023.02.06.15.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 15:14:33 -0800 (PST)
Date: Mon, 06 Feb 2023 23:14:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
In-Reply-To: <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
Message-ID: <697B6100-71D3-4339-B2EC-A324270F52DA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 06 Feb 2023 23:14:38 -0000



Am 6=2E Februar 2023 11:18:06 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 6/2/23 11:54, Andrea Bolognani wrote:
>> On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
>>> +    object_class_property_add(oc, "acpi", "OnOffAuto",
>>> +                              virt_get_acpi, virt_set_acpi,
>>> +                              NULL, NULL);
>>> +    object_class_property_set_description(oc, "acpi",
>>> +                                          "Enable ACPI");
>>=20
>> The way this works on other architectures (x86_64, aarch64) is that
>> you get ACPI by default and can use -no-acpi to disable it if
>> desired=2E Can we have the same on RISC-V, for consistency?
>
>-no-acpi rather seems a x86-specific hack for the ISA PC machine,

=2E=2E=2E for the i440FX/PIIX machine, to be precise=2E There it controls =
the presence of the PIIX ACPI controller and surely also the generation of =
ACPI tables=2E ACPI wasn't a thing in pure ISA times, so the switch doesn't=
 make much sense for the ISA machine=2E

Here, for RISC-V, the "acpi" switch seems to just control the generation o=
f ACPI tables which has quite different semantics than -no-acpi=2E

>and
>has a high maintenance cost / burden=2E
>
>If hardware provides ACPI support, QEMU should expose it to the guest=2E

Yes, I fully agree with both points=2E

>
>Actually, what is the value added by '-no-acpi'?

IIUC, it allows the PC machine to emulate a PCI PC without an ACPI bios=2E=
 Unfortunately, it also omits the instantiation of the=2E=2E=2E erm=2E=2E=
=2E Frankenstein PIIX4_ACPI device which seems quite unnecessary to achieve=
 that goal=2E Just always instantiating it seems much simpler=2E

