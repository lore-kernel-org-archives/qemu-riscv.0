Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hxpRq-0001vk-AC
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 05:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1hxpRn-0001uW-Lq
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 05:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hxpRm-0001YB-CH
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 05:19:59 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hxpRm-0001Xi-4E
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 05:19:58 -0400
Received: by mail-wm1-x341.google.com with SMTP id g67so3806719wme.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2019 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GVC3eqOMw6fknTK4q6WWr4vN9hd/YLEAouWGFY8rMTc=;
 b=u63KaraTAAI+H/LraewtxrRE+lmlfi2yNaBTrKJi0wwyTiamIwybI974620899XESm
 gS87+zlmbb8oOxLpuWX53VK9LRT/GI9jvXCB2OO9KrQKeS7x1RNEh8OjLCloECqSKHtC
 k1iWN291t+RE3iSnEJRh2yN1DZhs+p+0hmeGTei1f++gkhMLRnWJGzwnQ8fwbPWAegeo
 1hCCaWgmsSz42EKgc6xk1QF1S7dAoIst+TN4C7RcnXX6fzX0sUqd5obLuz5CdXJKed8W
 FW5oZ9FKs7HEucF4/ARoVL/g+nupTT1b9GHyr3gyKrcnYcxFLbf/lBi4jjJOcRxnQvrI
 5eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GVC3eqOMw6fknTK4q6WWr4vN9hd/YLEAouWGFY8rMTc=;
 b=uOJIB8rcuMVzaJs/R+J/tJejd4kONlSIcScxLMybujKOQmqm7BBMiqhgvCgIxH0kBn
 vk21yVFmH+c4Q5qKa+M9oITtUU+3KwZXl2Wz5jNCUamQb3bUkMT+PV8h8HpWy5Pv7aNt
 Mnp+XTBFvrO/ckcmM38gCy0sJlZl17oq0+NoPxEneN0wuIcicFotFLqlnNHWkzIKU2q5
 xCO+oUtloUXeoILhsTde+wNRWYG7wH4DRoo0o5JyH03/r7o9H9d3Y80Z1dx0m7BXVI6o
 CnEYx6pK3anOA5ka/DRdVx0D9kVy66AcIXUfNyN/ygMQEc9s6R7jvrElMSUAyfCH/pRR
 tqQQ==
X-Gm-Message-State: APjAAAUyxqIKmGEVwzXh0Gsw9u1X3UpEVhEtXiyLS9oXtcPndaaETThI
 ml5FPgHX2Dlu932tEyprOyRfvw==
X-Google-Smtp-Source: APXvYqy0CZetN9PiQK0eciLbMuWeiUd66hSv4+OGiBLeaQmxtR2z7L9sQP2NidstsTVKQB1Cy2060Q==
X-Received: by 2002:a1c:494:: with SMTP id 142mr7204869wme.12.1565774396381;
 Wed, 14 Aug 2019 02:19:56 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id p186sm763581wme.9.2019.08.14.02.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 02:19:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 505CA1FF87;
 Wed, 14 Aug 2019 10:19:55 +0100 (BST)
References: <CAKmqyKNPW=Jtp3PUdwuSzjNE7g58WdureNxAWUnK_KZ-Z17HnQ@mail.gmail.com>
 <mhng-5f5b5d32-dff8-45cd-9644-dd40e502fca1@palmer-si-x1e>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: alistair23@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, richard.henderson@linaro.org,
 armbru@redhat.com, Alistair Francis <Alistair.Francis@wdc.com>
In-reply-to: <mhng-5f5b5d32-dff8-45cd-9644-dd40e502fca1@palmer-si-x1e>
Date: Wed, 14 Aug 2019 10:19:55 +0100
Message-ID: <87y2zwm7d0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Wed, 14 Aug 2019 09:20:00 -0000


Palmer Dabbelt <palmer@sifive.com> writes:

> On Fri, 09 Aug 2019 18:55:42 PDT (-0700), alistair23@gmail.com wrote:
>> On Fri, Aug 9, 2019 at 2:22 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>
>>> We should avoid including the whole of softfloat headers in cpu.h and
>>> explicitly include it only where we will be calling softfloat
>>> functions. We can use the -types.h and -helpers.h in cpu.h for the few
>>> bits that are global.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> I just reviewed v1, but this also applies to v2:
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Acked-by: Palmer Dabbelt <palmer@sifive.com>
>
> I'm assuming this are going in through another tree, along with the
> rest of the patch set.

It will yes..

>
>>
>> Alistair
>>
>>> ---
>>>  target/riscv/cpu.c        | 1 +
>>>  target/riscv/cpu.h        | 2 +-
>>>  target/riscv/fpu_helper.c | 1 +
>>>  3 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index f8d07bd20ad..6d52f97d7c3 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -27,6 +27,7 @@
>>>  #include "qemu/error-report.h"
>>>  #include "hw/qdev-properties.h"
>>>  #include "migration/vmstate.h"
>>> +#include "fpu/softfloat-helpers.h"
>>>
>>>  /* RISC-V CPU definitions */
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 0adb307f329..240b31e2ebb 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -22,7 +22,7 @@
>>>
>>>  #include "qom/cpu.h"
>>>  #include "exec/cpu-defs.h"
>>> -#include "fpu/softfloat.h"
>>> +#include "fpu/softfloat-types.h"
>>>
>>>  #define TCG_GUEST_DEFAULT_MO 0
>>>
>>> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
>>> index b4f818a6465..0b79562a690 100644
>>> --- a/target/riscv/fpu_helper.c
>>> +++ b/target/riscv/fpu_helper.c
>>> @@ -21,6 +21,7 @@
>>>  #include "qemu/host-utils.h"
>>>  #include "exec/exec-all.h"
>>>  #include "exec/helper-proto.h"
>>> +#include "fpu/softfloat.h"
>>>
>>>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
>>>  {
>>> --
>>> 2.20.1


--
Alex Benn=C3=A9e

