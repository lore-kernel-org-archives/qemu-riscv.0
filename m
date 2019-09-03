Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i59ws-0002Cy-4n
	for mharc-qemu-riscv@gnu.org; Tue, 03 Sep 2019 10:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i59wq-0002Au-3Y
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 10:38:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i59wo-00043P-ER
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 10:38:19 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i59wo-00042O-67
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 10:38:18 -0400
Received: by mail-pl1-x642.google.com with SMTP id d3so8004774plr.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2019 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8MYd+lFoloNEHw0qLMoU3OSS3eKyWUwCcjVjCG5XqLo=;
 b=ur1nQyr/M5CKzzg45eWCcL0VWC8yBq/DDVArCSCvTCxDVxGmC8gvqbflX7XsAFJBaW
 leHQUHCtoHN/9IzTF4nt4sRJ4yh98LXs7flnePt286Cu80RwFW2bysvUTPeohGcXht2T
 /FFa+ww18zf61EUV/31aLm6FNUWc99w0gak6t52QLLgTjsh0yPs3QM8Ua5Y6w20eNE4S
 ZzsK5/BpX4J1NgDfTTKOa6i54bftEdGRWBTtlQmfsTI52RgdEN1EQCPSsqYEs6L6QpMp
 GL5iXwaKTpqI7bAWaJCCq6r0u33+3OPjD/CHHGkeS84ZAUVMztdO7vqa+Hrnkh5Kdqfv
 9rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8MYd+lFoloNEHw0qLMoU3OSS3eKyWUwCcjVjCG5XqLo=;
 b=Wk1YTL63GSWToPkCRNztCzsoy9mb1GFVsNUfsafSNwXXhgLwfzx1KISNXkdu7RIzdL
 JESebdYG413lKlZdYpyDS2qLitHFg23KPY5ctLPV0EgWTqicqrzdpI9zXrSPsFM8JeDp
 4CYLxQuzh4SkeavjIeEjXv79ByMFuOFqRKUOB6X8We0mK6c6vErJgv7+0V+evUyVDBD1
 sPDs6pIudykH+I75RegDkc7/xEv8xzKz20cL2/au8B0qaIK/3uHYMnRG20MsZdu1BOyy
 +HEhO63tS6WYhEI3Us6LLNRSxyLGfe6sYXHd+2Hlc2c08x54XnbU7R9A0EAJLlw7OB9t
 12eQ==
X-Gm-Message-State: APjAAAXaa8aFO0vuNHgq/AbkbQz0EHvrmUc99NRQCNCzdAXoyYiWpPEv
 GAyyAw+f6c3+/t1WAXrxh59OxQ==
X-Google-Smtp-Source: APXvYqzANab0lIOxbJTJ5JRviYrXMjrPk9A0tLoi2uhBU7DjQx9BleNTZBrwh2tG8ugzS8LaVYlbeQ==
X-Received: by 2002:a17:902:2ea2:: with SMTP id
 r31mr36284791plb.200.1567521496563; 
 Tue, 03 Sep 2019 07:38:16 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h70sm17002101pgc.36.2019.09.03.07.38.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 07:38:15 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: peter.maydell@linaro.org, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 Alistair.Francis@wdc.com, alex.bennee@linaro.org, aurelien@aurel32.net
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
 <3b85e9b6-8799-9682-9aaf-b688924cb52e@linaro.org>
 <841ebe5f-dd5e-c59d-d7e9-c246ad7741c0@c-sky.com>
 <f81553cc-0f95-003e-f608-f83f9a7e8dd2@linaro.org>
 <b439e5a8-8ade-2f90-d298-9cedd1b2333b@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e0617778-892c-0c83-71b8-a59bd375a85e@linaro.org>
Date: Tue, 3 Sep 2019 07:38:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b439e5a8-8ade-2f90-d298-9cedd1b2333b@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISCV: support riscv vector
 extension 0.7.1
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
X-List-Received-Date: Tue, 03 Sep 2019 14:38:21 -0000

On 9/2/19 12:45 AM, liuzhiwei wrote:
> 
> On 2019/8/29 下午11:09, Richard Henderson wrote:
>> On 8/29/19 5:45 AM, liuzhiwei wrote:
>>> Even in qemu,  it may be some situations that VSTART != 0. For example, a load
>>> instruction leads to a page fault exception in a middle position. If VSTART ==
>>> 0,  some elements that had been loaded before the exception will be loaded once
>>> again.
>> Alternately, you can validate all of the pages before performing any memory
>> operations.  At which point there will never be an exception in the middle.
> 
> As a vector instruction may access memory  across many pages,  is there any way
> to validate the pages? Page table walk ?Or some TLB APIs?

Yes, there are TLB APIs.  Several of them, depending on what is needed.

> #0  cpu_watchpoint_address_matches (wp=0x555556228110, addr=536871072, len=1)
> at qemu/exec.c:1094
> #1  0x000055555567204f in check_watchpoint (offset=160, len=1, attrs=...,
> flags=2) at qemu/exec.c:2803
> #2  0x0000555555672379 in watch_mem_write (opaque=0x0, addr=536871072, val=165,
> size=1, attrs=...) at qemu/exec.c:2878
> #3  0x00005555556d44bb in memory_region_write_with_attrs_accessor
> (mr=0x5555561292e0 <io_mem_watch>, addr=536871072, value=0x7fffedffe2c8,
> size=1, shift=0, mask=255, attrs=...)
>     at qemu/memory.c:553
> #4  0x00005555556d45de in access_with_adjusted_size (addr=536871072,
> value=0x7fffedffe2c8, size=1, access_size_min=1, access_size_max=8,
> access_fn=0x5555556d43cd <memory_region_write_with_attrs_accessor>,
>     mr=0x5555561292e0 <io_mem_watch>, attrs=...) at qemu/memory.c:594
> #5  0x00005555556d7247 in memory_region_dispatch_write (mr=0x5555561292e0
> <io_mem_watch>, addr=536871072, data=165, size=1, attrs=...) at qemu/memory.c:1480
> #6  0x00005555556f0d13 in io_writex (env=0x5555561efb58,
> iotlbentry=0x5555561f5398, mmu_idx=1, val=165, addr=536871072, retaddr=0,
> recheck=false, size=1) at qemu/accel/tcg/cputlb.c:909
> #7  0x00005555556f19a6 in io_writeb (env=0x5555561efb58, mmu_idx=1, index=0,
> val=165 '\245', addr=536871072, retaddr=0, recheck=false) at
> qemu/accel/tcg/softmmu_template.h:268
> #8  0x00005555556f1b54 in helper_ret_stb_mmu (env=0x5555561efb58,
> addr=536871072, val=165 '\245', oi=1, retaddr=0) at
> qemu/accel/tcg/softmmu_template.h:304
> #9  0x0000555555769f06 in cpu_stb_data_ra (env=0x5555561efb58, ptr=536871072,
> v=165, retaddr=0) at qemu/include/exec/cpu_ldst_template.h:182
> #10 0x0000555555769f80 in cpu_stb_data (env=0x5555561efb58, ptr=536871072,
> v=165) at /qemu/include/exec/cpu_ldst_template.h:194
> #11 0x000055555576a913 in csky_cpu_stb_data (env=0x5555561efb58,
> vaddr=536871072, data=165 '\245') at qemu/target/csky/csky_ldst.c:48
> #12 0x000055555580ba7d in helper_vdsp2_vstru_n (env=0x5555561efb58,
> insn=4167183360) at qemu/target/csky/op_vdsp2.c:1317
> 
> The path is not related to probe_write in the patch().

Of course.  It wasn't supposed to be.

> Could you give more details or a test case where watchpoint doesn't work
> correctly?

If the store partially, but not completely, overlaps the watchpoint.  This is
obviously much easier to do with large vector operations than with normal
integer operations.

In this case, we may have completed some of the stores before encountering the
watchpoint.  Which, inside check_watchpoint(), will longjmp back to the cpu
main loop.  Now we have a problem: the store is partially complete and it
should not be.

Therefore, we now have patches queued in tcg-next that adjust probe_write to
perform both access and watchpoint tests.  There is still target-specific code
that must be adjusted to match, so there are not currently any examples in the
tree to show.

However, the idea is:
  (1) Instructions that perform more than one host store must probe
      the entire range to be stored before performing any stores.

  (2) Instructions that perform more than one host load must either
      probe the entire range to be loaded, or collect the data in
      temporary storage.  If not using probes, writeback to the
      register file must be delayed until after all loads are done.

  (3) Any one probe may not cross a page boundary; splitting of the
      access across pages must be done by the helper.


r~

