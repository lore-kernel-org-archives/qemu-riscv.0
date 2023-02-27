Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWTnz-0000jk-TW
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 22:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWTny-0000iz-4C; Sun, 26 Feb 2023 22:03:58 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1pWTnw-0004js-0a; Sun, 26 Feb 2023 22:03:57 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxEzSOHfxjm+8FAA--.5615S3;
 Mon, 27 Feb 2023 11:03:42 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxf+SNHfxjDjM+AA--.11577S3; 
 Mon, 27 Feb 2023 11:03:41 +0800 (CST)
Subject: Re: [PATCH 74/76] tracing: remove transform.py
To: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, jiaxun.yang@flygoat.com, tsimpson@quicinc.com,
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-75-richard.henderson@linaro.org>
 <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
 <06a53b69-b58c-168f-7e7d-bf7d028ebccd@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <46edf7c4-2f46-fc97-588f-a951e57657da@loongson.cn>
Date: Mon, 27 Feb 2023 11:03:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <06a53b69-b58c-168f-7e7d-bf7d028ebccd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Cxf+SNHfxjDjM+AA--.11577S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZF47Ar4UKF43Zr48Xw17Awb_yoW8Kryfpa
 4ktasrKryfXFsYyws7u3yDXFyUWF9rJFWUWr18J3WrtFsxZw4jgrW29r1Fg3s8Xws3Xry7
 CFWYv348GrWjgr7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
 AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
 07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU8fsqJUUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 03:03:58 -0000


在 2023/2/26 上午2:38, Richard Henderson 写道:
> On 2/25/23 00:22, Daniel Henrique Barboza wrote:
>> Richard,
>>
>> Not sure if I forgot or missed something but this patch breaks my 
>> build as follows:
>>
>> $  make -j
>>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 
>> tests/fp/berkeley-softfloat-3 dtc
>> [1/885] Generating trace/trace-hw_hyperv.c with a custom command
>> FAILED: trace/trace-hw_hyperv.c
>> /usr/bin/python3 ../scripts/tracetool.py --backend=log 
>> --group=hw_hyperv --format=c 
>> /home/danielhb/work/qemu/hw/hyperv/trace-events trace/trace-hw_hyperv.c
>> Traceback (most recent call last):
>>    File "/home/danielhb/work/qemu/build/../scripts/tracetool.py", 
>> line 19, in <module>
>>      from tracetool import error_write, out, out_open
>>    File "/home/danielhb/work/qemu/scripts/tracetool/__init__.py", 
>> line 21, in <module>
>>      import tracetool.transform
>> ModuleNotFoundError: No module named 'tracetool.transform'
>
>
> I saw the same thing on gitlab, but not on my laptop.  Weird.
>
I always get this things.


[26/2330] Generating trace/trace-hw_block.h with a custom command
FAILED: trace/trace-hw_block.h
/usr/bin/python3 ../scripts/tracetool.py --backend=log --group=hw_block 
--format=h /root/qemu/hw/block/trace-events trace/trace-hw_block.h
Traceback (most recent call last):
   File "/root/qemu/build/../scripts/tracetool.py", line 19, in <module>
     from tracetool import error_write, out, out_open
   File "/root/qemu/scripts/tracetool/__init__.py", line 21, in <module>
     import tracetool.transform
ModuleNotFoundError: No module named 'tracetool.transform'

>> It seems that tracetool.py is still referring transform. This fixes 
>> the build
>> for me:
>>
>> $ git diff
>> diff --git a/scripts/tracetool/__init__.py 
>> b/scripts/tracetool/__init__.py
>> index 5393c7fc5c..c361815bc1 100644
>> --- a/scripts/tracetool/__init__.py
>> +++ b/scripts/tracetool/__init__.py
>> @@ -18,7 +18,6 @@
>>
>>   import tracetool.format
>>   import tracetool.backend
>> -import tracetool.transform
>
> I also removed some code below that used these symbols; they 
> themselves appear to be unused.
>
>
> r~


