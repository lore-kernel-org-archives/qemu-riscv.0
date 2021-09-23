Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTMB0-0006Kj-Vh
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 06:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTMAz-0006GF-BI
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 06:42:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTMAx-0006CF-Cq
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 06:42:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id w17so15741567wrv.10
 for <qemu-riscv@nongnu.org>; Thu, 23 Sep 2021 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NOZnnYyGpWEW51WXd6nrKYJpZ7o2sT3xFQtWxmfjndU=;
 b=MVAaOEj7MtCCWRXA69xRYMU72SR+Ov5KydBrTqzQjM2lXGrp4/g+lq0rmvliH5bjrl
 g6xZa1t24sVfhfLwcS7pCV6dpL4a+seG+G7E4fWt9kFPb3HFm6Lvm3IJftXpbqlmsNcr
 CTWBwNE3USakWK0lJYdeMG/e2S0oIJDu/dtzjt+03ffkIbr5pPPXvaK8tVTmqwuqE21u
 Tt5HOwvZYontnS+VCsXtWfLQeHtCDdLn0WWEtTiNQ584tvb9AkeBAltaXmDEgYZiKFv1
 6UcjtBNSVRUjfRw6tMoqo+EK1W+BiZJilM/6bF3OkpW8yzqMZ19frXT4TX6Tb1hAaeSv
 80ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NOZnnYyGpWEW51WXd6nrKYJpZ7o2sT3xFQtWxmfjndU=;
 b=GZ0nHB26SeMqG5ZEU6tEivJJ68oOeBnUp+SsRsBk2qzsBYGAg9QI9jdKpa8O2Wn9Ik
 sqiYq0iUPfhzG9QSCFDj3oFM0S+wop/2OyIX0gm4X9NfTKMmDka3I/IunV2uqyGNuZ2v
 29o4pJAL3M5SPaamTpiNJeYbbCWZoi5dO3Nx2yr4JkhyFxpE6M2TD3MFuHaNKDm5Rgad
 PAjGgsIIfA9mI7aLEeObia7TgPgocCJlYQlFQtC0YDbrsmEQfzBgi9D6MED5a7NhaI2j
 /RdnEn3pW77FUToJA3ePNcc6871SHBNmftBxwYmAiLk/tybT/I2c8E2CDzQ6CmG567V1
 gX5A==
X-Gm-Message-State: AOAM53243WY31uNtJ1Pq1nrM/fsticAhxLcS5HCOU7Nc39uWERhcdYXf
 USdUZ4EmKtDd8sbbNvfnBnDN0Roh3c2AWhWhubyZ3A==
X-Google-Smtp-Source: ABdhPJwuW+5/aURJ5RG6a2DoELZZtMSRRqLXoK0K2PclO3Ml5Bh23pFwidsnKCvbflXKnGPy2//bnzgV2Tay9spTG2M=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr15311248wmi.37.1632393717980; 
 Thu, 23 Sep 2021 03:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
 <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
In-Reply-To: <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 11:41:05 +0100
Message-ID: <CAFEAcA9aZ3HXmHc12X58N5k=1dfk6SZWEU9Uf1ErajNj0EHWxg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, Markus Armbruster <armbru@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Sep 2021 10:42:01 -0000

On Thu, 23 Sept 2021 at 11:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >> +static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
> >> +{
> >> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(dev);
> >> +
> >> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
> >> +    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
> >> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
> >> +                        DEVICE_LITTLE_ENDIAN);
> >
> > It looks like serial_mm_init() does one more thing:
> >
> >      qdev_set_legacy_instance_id(DEVICE(smm), base, 2);
> >
> > I am not sure what that is.
>
> I'll defer on Paolo / Marc-Andr=C3=A9 for that part, I think this is for
> migrating legacy (x86?) machines, which is not the case.

Yes, this is only needed for backwards-compatibility of incoming
migration data with old versions of QEMU which implemented migration
of devices with hand-rolled code. If a device didn't previously
handle migration at all then it should not now be setting the
legacy instance ID.

Speaking of migration, I notice that this QOM conversion does
not add a vmstate, which usually we do as part of the QOM conversion.
The device is also missing a reset method.

thanks
-- PMM

