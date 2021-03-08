Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJHDh-0001ug-VW
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 09:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHDg-0001sj-Hj; Mon, 08 Mar 2021 09:50:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:44350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHDd-0002Hv-EQ; Mon, 08 Mar 2021 09:50:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52A9EAE30;
 Mon,  8 Mar 2021 14:50:45 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/8] sysemu/tcg: Restrict tcg_exec_init() to
 CONFIG_TCG
To: David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-2-f4bug@amsat.org>
 <e927dd5b-85c5-ddbf-aa16-2d1401a10bc3@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <442914dd-1059-dba4-fc14-09671e041747@suse.de>
Date: Mon, 8 Mar 2021 15:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e927dd5b-85c5-ddbf-aa16-2d1401a10bc3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Mar 2021 14:50:53 -0000

On 3/8/21 2:40 PM, David Hildenbrand wrote:
> On 04.03.21 23:23, Philippe Mathieu-Daudé wrote:
>> Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
>> to CONFIG_TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/sysemu/tcg.h | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>> index 00349fb18a7..fddde2b6b9a 100644
>> --- a/include/sysemu/tcg.h
>> +++ b/include/sysemu/tcg.h
>> @@ -8,13 +8,15 @@
>>   #ifndef SYSEMU_TCG_H
>>   #define SYSEMU_TCG_H
>>   
>> +#ifndef CONFIG_TCG
>> +#define tcg_enabled() 0
>> +#else
>> +
>>   void tcg_exec_init(unsigned long tb_size, int splitwx);
>>   
>> -#ifdef CONFIG_TCG
>>   extern bool tcg_allowed;
>>   #define tcg_enabled() (tcg_allowed)
>> -#else
>> -#define tcg_enabled() 0
>> -#endif
>> +
>> +#endif /* CONFIG_TCG */
>>   
>>   #endif
>>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
Reviewed-by: Claudio Fontana <cfontana@suse.de>

