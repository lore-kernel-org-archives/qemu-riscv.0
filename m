Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLZ4H-00055Q-HP
	for mharc-qemu-riscv@gnu.org; Fri, 18 Oct 2019 16:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iLZ4E-00054b-Sg
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 16:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iLZ4D-0005Vp-MU
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 16:41:46 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iLZ4D-0005Uu-Ds
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 16:41:45 -0400
Received: by mail-pl1-x642.google.com with SMTP id s17so3391931plp.6
 for <qemu-riscv@nongnu.org>; Fri, 18 Oct 2019 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MLz7DnVdESSnmHkJ4Sc37niu2QQkAm0+3fXFiaPQXJE=;
 b=nBUrreQkpUmAByHTWzfYZfkEGqXWMHJQFbN8qUEEMbeXllXlYEPkqRlyhxjkgJ2WwG
 R81fX8RtoNq4rFEluaBHBvjkzQ96rjPvUjkvEJ33osihmy+GKjaLnd/MfRJ/fwtxztiL
 /Kx73p+cQOlkNYujrc/1WzhotFJ19KPs2WvSR/MUWvPWgCBWt75XQnlQ8g3GFMwkWNdw
 Fsxlfft9WVSjMPtGhIH+LILnNiOP91xNbVbSDrS3CXuYfLka77k1mUVVxVC/hQkhWAEY
 4WmiVXxZl66CyYOJn+tDkxKbnaVxgV4w1EGqjsnUD+iu1hiUFEs4VXv9KWUN3V10sY7z
 L+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MLz7DnVdESSnmHkJ4Sc37niu2QQkAm0+3fXFiaPQXJE=;
 b=mhIdY/RJrc+8vLfz5YpWu0zRyyhdXjjcS666JFayxdFisByIBEWfhS0nfrZtiw8mXS
 6sl0DR0DieMks1JmQMUxev3lPWXrcD/2G4TnMWaTZFiapowNNinffyrXO+pDAcRKlUgn
 W5I+/wNMs/cKiUu6He164vyM8caO09KL9n9thaKb+RjGiwh48IbMnWrRjEaaKo9mHwJ8
 BmAs1jOClMxRvKwxPyZxzNZxzerEv81lHDLaX8ertgL7+IC64tHgo9Ouy5mlxWYZjblf
 9slfw35VKokDHyaP0gipKS10gqBeorkWBfpt9qKYRtxuYWULQdpNHWz7ub9jcIYORwvf
 lbOg==
X-Gm-Message-State: APjAAAXYNC+7uHLbhxsQ3YSWUgpGwXTaCsoRaxfSKPsQKUXIMUqnHSZY
 7tRkncIbsX6staK75LLr79/TRA==
X-Google-Smtp-Source: APXvYqxHXvByHlY/eL1PwTCF/HIST0o6FRRo+d+t8Wi36ji+gjjirg/0PkVTMNmGqJpdm1mh2R0zrA==
X-Received: by 2002:a17:902:8542:: with SMTP id
 d2mr11829756plo.86.1571431303381; 
 Fri, 18 Oct 2019 13:41:43 -0700 (PDT)
Received: from localhost ([152.179.112.46])
 by smtp.gmail.com with ESMTPSA id m12sm8965342pff.66.2019.10.18.13.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 13:41:42 -0700 (PDT)
Date: Fri, 18 Oct 2019 13:41:42 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2019 13:40:14 PDT (-0700)
Subject: Re: [PATCH v2 1/1] riscv/boot: Fix possible memory leak
In-Reply-To: <CAFEAcA_Sk2VFxxHV92RpaaRt3MLY2n_xYYM7CSwTTcxLDVtsgg@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-91e0cd9d-237f-4dce-9ebf-2cc863c1b012@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Fri, 18 Oct 2019 20:41:48 -0000

On Thu, 17 Oct 2019 05:08:39 PDT (-0700), Peter Maydell wrote:
> Ping? It would be nice to see this patch get into master
> to silence the coverity errors.

Sorry, it looks like I dropped this.  It's in my queue, I hope to submit a PR 
soon.

>
> thanks
> -- PMM
>
> On Thu, 3 Oct 2019 at 18:05, Alistair Francis <alistair.francis@wdc.com> wrote:
>>
>> Coverity (CID 1405786) thinks that there is a possible memory leak as
>> we don't guarantee that the memory allocated from riscv_find_firmware()
>> is freed. This is a false positive, but let's tidy up the code to fix
>> the warning.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v2:
>>  - Fix commit typos
>>
>>  hw/riscv/boot.c | 11 ++++-------
>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 2e92fb0680..7fee98d2f8 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -38,7 +38,7 @@ void riscv_find_and_load_firmware(MachineState *machine,
>>                                    const char *default_machine_firmware,
>>                                    hwaddr firmware_load_addr)
>>  {
>> -    char *firmware_filename;
>> +    char *firmware_filename = NULL;
>>
>>      if (!machine->firmware) {
>>          /*
>> @@ -70,14 +70,11 @@ void riscv_find_and_load_firmware(MachineState *machine,
>>           * if no -bios option is set without breaking anything.
>>           */
>>          firmware_filename = riscv_find_firmware(default_machine_firmware);
>> -    } else {
>> -        firmware_filename = machine->firmware;
>> -        if (strcmp(firmware_filename, "none")) {
>> -            firmware_filename = riscv_find_firmware(firmware_filename);
>> -        }
>> +    } else if (strcmp(machine->firmware, "none")) {
>> +        firmware_filename = riscv_find_firmware(machine->firmware);
>>      }
>>
>> -    if (strcmp(firmware_filename, "none")) {
>> +    if (firmware_filename) {
>>          /* If not "none" load the firmware */
>>          riscv_load_firmware(firmware_filename, firmware_load_addr);
>>          g_free(firmware_filename);
>> --
>> 2.23.0

