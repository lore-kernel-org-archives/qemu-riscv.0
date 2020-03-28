Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIEFR-0005H5-AP
	for mharc-qemu-riscv@gnu.org; Sat, 28 Mar 2020 12:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIEFO-0005DM-59
 for qemu-riscv@nongnu.org; Sat, 28 Mar 2020 12:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIEFN-0003H2-7V
 for qemu-riscv@nongnu.org; Sat, 28 Mar 2020 12:23:46 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:36392)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIEFK-0003BW-Gn; Sat, 28 Mar 2020 12:23:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08911659|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.139685-0.000514931-0.8598;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03297; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H6jfVbC_1585412611; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H6jfVbC_1585412611)
 by smtp.aliyun-inc.com(10.147.42.135);
 Sun, 29 Mar 2020 00:23:32 +0800
Subject: Re: [PATCH v6 55/61] target/riscv: integer extract instruction
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-56-zhiwei_liu@c-sky.com>
 <07501722-9afa-0a47-bba5-434631335372@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <d9001356-0d1f-3b0d-7a5d-a1c86e72ccf6@c-sky.com>
Date: Sun, 29 Mar 2020 00:23:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <07501722-9afa-0a47-bba5-434631335372@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Sat, 28 Mar 2020 16:23:47 -0000



On 2020/3/28 11:36, Richard Henderson wrote:
> On 3/17/20 8:06 AM, LIU Zhiwei wrote:
>> +/* Integer Extract Instruction */
>> +static void extract_element(TCGv dest, TCGv_ptr base,
>> +                            int ofs, int sew)
>> +{
>> +    switch (sew) {
>> +    case MO_8:
>> +        tcg_gen_ld8u_tl(dest, base, ofs);
>> +        break;
>> +    case MO_16:
>> +        tcg_gen_ld16u_tl(dest, base, ofs);
>> +        break;
>> +    default:
>> +        tcg_gen_ld32u_tl(dest, base, ofs);
>> +        break;
>> +#if TARGET_LONG_BITS == 64
>> +    case MO_64:
>> +        tcg_gen_ld_i64(dest, base, ofs);
>> +        break;
>> +#endif
>> +    }
>> +}
> I just remembered that this doesn't handle HOST_WORDS_BIGENDIAN properly -- the
> MO_64 case for TARGET_LONG_BITS == 32.
>
> Because we computed the offset for MO_64, not MO_32, we need
>
>      case MO_64:
>          if (TARGET_LONG_BITS == 64) {
>              tcg_gen_ld_i64(dest, base, ofs);
>              break;
>          }
> #ifdef HOST_WORDS_BIGENDIAN
>          ofs += 4;
> #endif
>          /* fall through */
>      case MO_32:
>          tcg_gen_ld32u_tl(dest, base, ofs);
>          break;
>      default:
>          g_assert_not_reached();
Yes, it should be.

As extract_element and gather_element are very similar . I
will merge them to  load_element in v7.

Zhiwei
>
> r~


