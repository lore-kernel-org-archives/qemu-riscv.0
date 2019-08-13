Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxgFX-0003kk-3d
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 19:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hxgFU-0003kX-Vf
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 19:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hxgFT-0001fx-Uu
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 19:30:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hxgFT-0001fJ-PI
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 19:30:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id v12so4682458pfn.10
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 16:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=arm4K0dKxYKw4Fxge2NFXBM/nUogYItcCwIYo5sd70w=;
 b=Xyfkgh0rCewBDzzFRxZ4hh9XI7QwBVRwxeUe42nsrpHI5phDpXrRc38sof54wYkEcB
 mwQ0GTn0vGlrqP8ZyuOrdq1XoWZvs9lcoc+MxL7h3rAf2X6qDu5IKtzMzXs623dgyhS0
 jjWTkuzu3yuP57g/KNAqZDzZsalvm8uuvFOuUjzfdXp57ABUCKy7fFxbCPBx3L61zWwv
 KRoSpRkKKSy7+AamhmsV+YT3yvftMGYxVjY/47nQ80SI34IZ1eJFqsHIRFjkGSBSJSu1
 qf0aDZW8eoIMYyPr94sZ1Dlc0Rf8UAqFwhgzfbOe/9fM7ZvQVGr/Mal2FoRvkrQHxFlv
 NSJw==
X-Gm-Message-State: APjAAAXdOLgbP3VAfJnh6wWQNbFXTVFWMfHBYFqczHhaztpybB0OVP9J
 RX0UPMsAwYXUcQHUogBzAE//tA==
X-Google-Smtp-Source: APXvYqxLszqPSThKRjLAYe9DqoOaL3X5RvYYYX/b9g1U7WAMDOOLi+2VTUEQ26MR46Z4n718l2u85A==
X-Received: by 2002:a17:90a:71ca:: with SMTP id
 m10mr4541490pjs.27.1565739038179; 
 Tue, 13 Aug 2019 16:30:38 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s24sm75455293pgm.3.2019.08.13.16.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 16:30:37 -0700 (PDT)
Date: Tue, 13 Aug 2019 16:30:37 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Aug 2019 16:27:49 PDT (-0700)
In-Reply-To: <CAKmqyKNPW=Jtp3PUdwuSzjNE7g58WdureNxAWUnK_KZ-Z17HnQ@mail.gmail.com>
CC: alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 richard.henderson@linaro.org, armbru@redhat.com,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-5f5b5d32-dff8-45cd-9644-dd40e502fca1@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 6/7] target/riscv:
 rationalise softfloat includes
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
X-List-Received-Date: Tue, 13 Aug 2019 23:30:42 -0000

On Fri, 09 Aug 2019 18:55:42 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Aug 9, 2019 at 2:22 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> We should avoid including the whole of softfloat headers in cpu.h and
>> explicitly include it only where we will be calling softfloat
>> functions. We can use the -types.h and -helpers.h in cpu.h for the few
>> bits that are global.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I just reviewed v1, but this also applies to v2:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Palmer Dabbelt <palmer@sifive.com>

I'm assuming this are going in through another tree, along with the rest of the 
patch set.

>
> Alistair
>
>> ---
>>  target/riscv/cpu.c        | 1 +
>>  target/riscv/cpu.h        | 2 +-
>>  target/riscv/fpu_helper.c | 1 +
>>  3 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index f8d07bd20ad..6d52f97d7c3 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -27,6 +27,7 @@
>>  #include "qemu/error-report.h"
>>  #include "hw/qdev-properties.h"
>>  #include "migration/vmstate.h"
>> +#include "fpu/softfloat-helpers.h"
>>
>>  /* RISC-V CPU definitions */
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 0adb307f329..240b31e2ebb 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -22,7 +22,7 @@
>>
>>  #include "qom/cpu.h"
>>  #include "exec/cpu-defs.h"
>> -#include "fpu/softfloat.h"
>> +#include "fpu/softfloat-types.h"
>>
>>  #define TCG_GUEST_DEFAULT_MO 0
>>
>> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
>> index b4f818a6465..0b79562a690 100644
>> --- a/target/riscv/fpu_helper.c
>> +++ b/target/riscv/fpu_helper.c
>> @@ -21,6 +21,7 @@
>>  #include "qemu/host-utils.h"
>>  #include "exec/exec-all.h"
>>  #include "exec/helper-proto.h"
>> +#include "fpu/softfloat.h"
>>
>>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
>>  {
>> --
>> 2.20.1

