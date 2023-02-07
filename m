Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPL8w-0000R2-B2
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 05:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPL8t-0000P7-1p
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 05:24:03 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPL8m-00069S-N7
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 05:23:58 -0500
Received: by mail-ej1-x629.google.com with SMTP id c13so125536ejz.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 02:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bJCbIn/X3OEHsr0kP2AP7buRcYHWFmb4XL0AYUpRdFM=;
 b=genjaXAxfvpYtmrRmNhxGucPdT75NDwtY8ZFpptqPKpTKbT8jj7W4LAYpf+xDzSH9K
 qASfV7QCJE49WIvcCvzgtdKq79hmWaVQpLLoBucnCIOIaiD4h2Aacc6sjwuuIpoMUihf
 hVjoCEIHqyCs/Dub15w7rzIxnNuO3YiEhD0CBsYtthnDkST9khHBG8PUh0j4IkP+MVB/
 0OyxgWxtDUiDQnCT/G0jzxoFX0r+UII+ZtW/Ovu10NJGWEQJ2sPj5PRRQZkLYlyhtLUH
 TZLtrhNOBU8rexodwm9WukOXz/c948eviaXkwd6o/xFdinNzrbOOoFJanJwMQf7zo/Qk
 3NxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJCbIn/X3OEHsr0kP2AP7buRcYHWFmb4XL0AYUpRdFM=;
 b=ho16K2d5hSs8vg558Zit0oDD7FJG+2IEUjGx4ZZ3fZxTZ0L2iA7njw8HqozuwNRehd
 f5N50/zLw2sBnHRghfsYD52aT0Fsm8J1gfOn9+vsZk18qJIZBiSoE5yalbwZbqphqHvb
 dEqmRk6HWK2CBuPz+/o4ECzKBovZVDhHPPp8HlHYNSLSjTuuXrmFmRDixcZQWs0ETeWy
 PHCPYGa+2KmwYoVD/eaKEIvVjHGNsjhUeHIlYBZAV6a4lhCe6fY8ZUdrazj/gsZY6ua2
 CaIIzzQF+gbPiJkqJbYETmBTzOzVi64RCDggnDIoCod39ngaEt1cGQTgHGcd73vXv4br
 kfew==
X-Gm-Message-State: AO0yUKWQicXXk3JXCertna2BHVLjcYmg8MWDP1guNinTw3qvU9mJU9G5
 dBZFMVL5soNnDJ20Sr02xk8xyA==
X-Google-Smtp-Source: AK7set8hSotccKhxvoJcYtgAJCHWufyOfchofHPEwaZXOY4wsnGpsL1C5AmOxbiKOGXagHngG9jqWw==
X-Received: by 2002:a17:906:f1c1:b0:7c1:458b:a947 with SMTP id
 gx1-20020a170906f1c100b007c1458ba947mr3114932ejb.26.1675765434806; 
 Tue, 07 Feb 2023 02:23:54 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 ot17-20020a170906ccd100b0088272bac7c5sm6631246ejb.121.2023.02.07.02.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 02:23:54 -0800 (PST)
Date: Tue, 7 Feb 2023 11:23:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <20230207102353.hpg2gxh22urjbebu@orel>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 07 Feb 2023 10:24:03 -0000

On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> On 6/2/23 11:54, Andrea Bolognani wrote:
> > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > +                              virt_get_acpi, virt_set_acpi,
> > > +                              NULL, NULL);
> > > +    object_class_property_set_description(oc, "acpi",
> > > +                                          "Enable ACPI");
> > 
> > The way this works on other architectures (x86_64, aarch64) is that
> > you get ACPI by default and can use -no-acpi to disable it if
> > desired. Can we have the same on RISC-V, for consistency?
> 
> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> has a high maintenance cost / burden.

Can you elaborate on this? RISCV doesn't need '-no-acpi' specifically.
If -no-acpi is problematic for some reason, then something like
'-machine virt,acpi=off' would be sufficient for switching to DT too.

Thanks,
drew

