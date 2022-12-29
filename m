Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAtkJ-000164-Je
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 09:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pAtk3-00013w-Kh
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 09:18:55 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pAtk1-0007nN-QK
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 09:18:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id n3so16759187wrc.5
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nrfj30j79pAUBcHR2oTif20hYY/cMNFQ8JpYCcyj0qw=;
 b=L50ThA7fxi6E0ylNYRVpC07yVVtcLI3FBUWocF4BuYYDFsnUsUISNHWewiRYocrUDG
 m4EumLI6oGCw5uRmv8QvRgL5pi9qr0fTXBIUoMZZmdHdEDnIVGvszVli7GB1mEXs3vhy
 lpZel2gZSKAGsowoG7pLA7A5IGocWYMUXgbQ8024dzExc9HLqQaecAVm8ug+jtOI7wUe
 s2xahDsp2vyBdGtPCaL5S7KCxPPZBV+oV69xwT0ym+LuABc0lLfHJfOCeMR6P0bjLjRG
 tZtmGVKwtAj9ph5AeZAAEYZWl9J0lvsLa5BwtfpOf44htAhrKtrFsXoB3vZ8mYs3eULB
 rbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nrfj30j79pAUBcHR2oTif20hYY/cMNFQ8JpYCcyj0qw=;
 b=N7ITQiPJok1Kmz1equyL1EJ1fDBYKpbzbhT5PM1C93UkRweVPrnKDHoTzYfBJsWGTX
 q2hEDFirSRrgysMRCurUVT9FH8WzyD7LYK8yFyYUpxrKy30Q6EcRAC0azk4/HFFiuXNm
 8bDpxXy6fzOepmIDiVIpDuus+7kJP38s4r5rlfg2KgWZZmGO/J/rJILyGkMnzmBBGE+I
 bYeAGMCYdhxNF/WBqBRB5Hm8C65SdEF8pVMjdhSvQkroX991ZDE2Y8LKMyfS6qduwhiM
 3SBsD6/26gdA0hZd5wYeCFL+rOGtYlNCn6+cX+6Aw5csqjzkiEfwU0rP8ULbQSxJVYBJ
 FQOw==
X-Gm-Message-State: AFqh2kogn88N5lpyyTcnBoHvS2qatAkTXfYV3kLGixP3ty4lFf0xtRc+
 w8SQeyhlG5UMUXC82Cc3/J8f6w==
X-Google-Smtp-Source: AMrXdXvN/dRUO58VBb3VdsiLCaS7Q8vOqFv2rrHCeBF6BmHOIGQhfXxIFPJcIt+n4mmN9J5jUF/PSQ==
X-Received: by 2002:a05:6000:5ca:b0:24f:11eb:2988 with SMTP id
 bh10-20020a05600005ca00b0024f11eb2988mr17065038wrb.71.1672323518536; 
 Thu, 29 Dec 2022 06:18:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d6983000000b00287da7ee033sm4270741wru.46.2022.12.29.06.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 06:18:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 503091FFB7;
 Thu, 29 Dec 2022 14:18:37 +0000 (GMT)
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-8-dbarboza@ventanamicro.com>
 <bebabfa6-483c-a604-fe8d-9d0585f505db@linaro.org>
 <70a0cd63-48e0-a79b-995b-fd34104c64a6@ventanamicro.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org,
 alistair.francis@wdc.com, Bin Meng <bin.meng@windriver.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 07/10] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Date: Thu, 29 Dec 2022 14:17:51 +0000
In-reply-to: <70a0cd63-48e0-a79b-995b-fd34104c64a6@ventanamicro.com>
Message-ID: <87r0wipa2q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 14:18:57 -0000


Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:

> On 12/28/22 12:51, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 28/12/22 14:33, Daniel Henrique Barboza wrote:
>>> 'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
>>> retrieved by the MachineState object for all callers.
>>>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>>> ---
>>> =C2=A0 hw/riscv/boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 6 ++++--
>>> =C2=A0 hw/riscv/microchip_pfsoc.c | 3 +--
>>> =C2=A0 hw/riscv/sifive_u.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
3 +--
>>> =C2=A0 hw/riscv/spike.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 3 +--
>>> =C2=A0 hw/riscv/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3 +--
>>> =C2=A0 include/hw/riscv/boot.h=C2=A0=C2=A0=C2=A0 | 3 +--
>>> =C2=A0 6 files changed, 9 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>> index d3c71b3f0b..f7e806143a 100644
>>> --- a/hw/riscv/boot.c
>>> +++ b/hw/riscv/boot.c
>>> @@ -204,9 +204,11 @@ target_ulong riscv_load_kernel(const char *kernel_=
filename,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(1);
>>> =C2=A0 }
>>> =C2=A0 -void riscv_load_initrd(const char *filename, uint64_t mem_size,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t ke=
rnel_entry, void *fdt)
>>> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 const char *filename =3D machine->initrd_filename;
>>
>> Do we want to check for missing -initrd here? Or simply return quietly
>> if not provided?
>
> This function is always called after a "if (!machine->initrd_filename)", =
so we can
> be certain that -initrd will always be present if the function is
> called.

If that is an API guarantee we should assert that is the case then as
calling without machine->initrd_filename would be a bug.=20

>
> Perhaps one thing that we could do is to remove this check and fold it in=
side the
> function, right at the start, to make the function behavior independent o=
f what
> the caller is doing. We could do that at patch 9/10 where we'll end up wi=
th a single
> caller instead of 4-5.
>
>
> Daniel
>
>>
>>> +=C2=A0=C2=A0=C2=A0 uint64_t mem_size =3D machine->ram_size;
>>> +=C2=A0=C2=A0=C2=A0 void *fdt =3D machine->fdt;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwaddr start, end;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssize_t size;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

