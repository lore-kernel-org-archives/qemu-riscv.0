Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZbSq-0003yZ-44
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 11:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZbSo-0003uY-FO; Thu, 22 Apr 2021 11:41:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZbSm-0006uj-FJ; Thu, 22 Apr 2021 11:41:58 -0400
Received: by mail-wr1-x433.google.com with SMTP id c15so36328552wro.13;
 Thu, 22 Apr 2021 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zdwPrYCs6gn/HmvKJUdoJG36ORJX5e0qCIAVYy9yugE=;
 b=WXze/7wruRA6jZY5OAH7HI6pWWEyyuTwheI2mKfz4A7CLZ4/7smrymAHBgKZjL6Z7J
 nc2ZoR7pt8HGASK3IyNzbbInHVGb56c9twtJ38PyA8Th+T5gY9oXC5B6aFsiXL7wqPa8
 MIwHgUXBDiZf9yVZ1ohIsaZZfWF1/tvldQiOZcD4jSZ+2YPv8YnCTcPlUP011HfIOxRx
 RYzWwjed/kRioXNzixucAA3Kl2EmOlg5VXtLLyU/MNh54/HzIqa6a0D93i/6AqKnmO87
 ZfuzrVCYEFDvEyTYrhZUhD2ip44yuG8w/6lXDdYvdQhqzVIDD014isReWxtDT1IiCBKe
 Cezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zdwPrYCs6gn/HmvKJUdoJG36ORJX5e0qCIAVYy9yugE=;
 b=hOe2M4Uj4zHUj/YhkEGMzTPRyZYUGnLLrL8hbV33zDnKzm0wqgAEkST5Caw1ivFf0t
 hcAQ7k6Qr0lpRvDSonbZc9/2OqLQa+NkNjDHdC2FKT/9lAg7gkUvdIup8To87BuQqc0I
 UvTamuEJRKBvbdCYacAAS0/h1JnNRAJzINVEQZS4fVUJvOFJfuF1oqvIE3tkGysFEgdB
 1mZ/2s7rvhyip81urEjPNtiQq5RFOM8UbTWr7hhURGgPX4Hk0Lp3uG/9KJbhcuvcfYti
 pmISzxcqE5Jsokw+d0ahN7xEtuAKfU91lPgM9EVca3pJnSMGyEl0TN1uT4flVzt7qxc0
 V6+g==
X-Gm-Message-State: AOAM531D0IeQMsldjtMUumALQmFb7ECgHuhqTPn5zFjTuQ0o0Ox2WYJI
 kc5GFx0MN+arSWPpGNRbcq4=
X-Google-Smtp-Source: ABdhPJwhHuvrk9Yfe76yp7Fq79T0vzYqoVkWp1+jwCVCp6+Uv8pEPhOzO3X7Kbq7Xt7sBFc1YySg2g==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr5015011wrn.6.1619106112770;
 Thu, 22 Apr 2021 08:41:52 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i12sm4198935wrm.77.2021.04.22.08.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 08:41:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
 <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
 <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
 <6bfaaaab-8045-d8be-4edd-652d500a6c14@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <280abf24-4e72-78ed-621b-b66495943003@amsat.org>
Date: Thu, 22 Apr 2021 17:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6bfaaaab-8045-d8be-4edd-652d500a6c14@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 22 Apr 2021 15:41:58 -0000

On 4/22/21 1:01 PM, Philippe Mathieu-Daudé wrote:
> On 4/22/21 12:28 PM, Peter Maydell wrote:
>> On Thu, 22 Apr 2021 at 10:55, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> My guess is CPUState is the only device used in user emulation,
>>> so it would be a way to restrict the vmstate_dummy to CPU and
>>> not to any DeviceState?
>>>
>>> But looking at the introductory commit:
>>>
>>> commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
>>> Author: Andreas Färber <afaerber@suse.de>
>>> Date:   Sun Jan 20 20:23:22 2013 +0100
>>>
>>>     cpu: Register VMStateDescription through CPUState
>>>
>>>     In comparison to DeviceClass::vmsd, CPU VMState is split in two,
>>>     "cpu_common" and "cpu", and uses cpu_index as instance_id instead of -1.
>>>     Therefore add a CPU-specific CPUClass::vmsd field.
>>>
>>>     Unlike the legacy CPUArchState registration, rather register CPUState.
>>>
>>> Juan, do you remember?
>>
>> Oh yes, I remember this. There are two ways to handle migration for
>> a CPU object:
>>
>>  (1) like any other device, so it has a dc->vmsd that covers
>> migration for the whole object. As usual for objects that are a
>> subclass of a parent that has state, the first entry in the
>> VMStateDescription field list is VMSTATE_CPU(), which migrates
>> the cpu_common fields, followed by whatever the CPU's own migration
>> fields are.

target/alpha/cpu.c:240:    dc->vmsd = &vmstate_alpha_cpu;
target/cris/cpu.c:296:    dc->vmsd = &vmstate_cris_cpu;
target/hppa/cpu.c:165:    dc->vmsd = &vmstate_hppa_cpu;
target/m68k/cpu.c:537:    dc->vmsd = &vmstate_m68k_cpu;
target/microblaze/cpu.c:390:    dc->vmsd = &vmstate_mb_cpu;
target/openrisc/cpu.c:207:    dc->vmsd = &vmstate_openrisc_cpu;
target/sh4/cpu.c:265:    dc->vmsd = &vmstate_sh_cpu;
target/unicore32/cpu.c:149:    dc->vmsd = &vmstate_uc32_cpu;
target/xtensa/cpu.c:221:    dc->vmsd = &vmstate_xtensa_cpu;

>>  (2) a backwards-compatible mechanism for CPUs that were
>> originally migrated using manual "write fields to the migration
>> stream structures". The on-the-wire migration format
>> for those is based on the 'env' pointer (which isn't a QOM object),
>> and the cpu_common part of the migration data is elsewhere.

target/arm/cpu.c:1985:    cc->vmsd = &vmstate_arm_cpu;
target/avr/cpu.c:216:    cc->vmsd = &vms_avr_cpu;
target/i386/cpu.c:7434:    cc->vmsd = &vmstate_x86_cpu;
target/lm32/cpu.c:244:    cc->vmsd = &vmstate_lm32_cpu;
target/mips/cpu.c:723:    cc->vmsd = &vmstate_mips_cpu;
target/moxie/cpu.c:125:    cc->vmsd = &vmstate_moxie_cpu;
target/ppc/translate_init.c.inc:10923:    cc->vmsd = &vmstate_ppc_cpu;
target/riscv/cpu.c:627:    cc->vmsd = &vmstate_riscv_cpu;
target/s390x/cpu.c:520:    cc->vmsd = &vmstate_s390_cpu;
target/sparc/cpu.c:892:    cc->vmsd = &vmstate_sparc_cpu;

>> cpu_exec_realizefn() handles both possibilities:
>>  * for type 1, dc->vmsd is set and cc->vmsd is not,
>>    so cpu_exec_realizefn() does nothing, and the standard
>>    "register dc->vmsd for a device" code does everything needed
>>  * for type 2, dc->vmsd is NULL and so we register the vmstate_cpu_common
>>    directly to handle the cpu-common fields, and the cc->vmsd to handle
>>    the per-CPU stuff
>>
>> You can't change a CPU from one type to the other without breaking
>> migration compatibility, which is why some guest architectures
>> are stuck on the cc->vmsd form. New targets should use dc->vmsd.

IOW new targets should use type 1.


Looking at type 2:

a) targets added 'recently' with the incorrect type 2:

target/avr/cpu.c:216:    cc->vmsd = &vms_avr_cpu;
target/riscv/cpu.c:627:    cc->vmsd = &vmstate_riscv_cpu;

b) targets where migration isn't really an issue:

target/lm32/cpu.c:244:    cc->vmsd = &vmstate_lm32_cpu;
target/moxie/cpu.c:125:    cc->vmsd = &vmstate_moxie_cpu;

c) targets where migration could be broken:

target/mips/cpu.c:723:    cc->vmsd = &vmstate_mips_cpu;
target/sparc/cpu.c:892:    cc->vmsd = &vmstate_sparc_cpu;

d) KVM targets ("security boundary" or Tier-1) are left:

target/arm/cpu.c:1985:    cc->vmsd = &vmstate_arm_cpu;
target/i386/cpu.c:7434:    cc->vmsd = &vmstate_x86_cpu;
target/ppc/translate_init.c.inc:10923:    cc->vmsd = &vmstate_ppc_cpu;
target/s390x/cpu.c:520:    cc->vmsd = &vmstate_s390_cpu;


Isn't "machine type" what allows us to change migration stream?
All targets in d) do support that.


How could we enforce no new type 2 targets?


Thanks,

Phil.

