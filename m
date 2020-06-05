Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jh2To-0001uE-6f
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 22:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jh2Tm-0001si-Gx; Thu, 04 Jun 2020 22:53:10 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jh2Tl-0001KP-H9; Thu, 04 Jun 2020 22:53:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0580995|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.128739-0.000914105-0.870347;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03294; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=7; RT=7; SR=0; TI=SMTPD_---.HiLx6yx_1591325583; 
Received: from 30.225.208.46(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HiLx6yx_1591325583)
 by smtp.aliyun-inc.com(10.147.43.230);
 Fri, 05 Jun 2020 10:53:04 +0800
Subject: Re: [PATCH v8 58/62] target/riscv: floating-point scalar move
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-59-zhiwei_liu@c-sky.com>
 <be24e64c-4f3b-c507-7ed8-f7697bea5957@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <91585aec-eb7f-7188-719e-416ac065124d@c-sky.com>
Date: Fri, 5 Jun 2020 10:53:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <be24e64c-4f3b-c507-7ed8-f7697bea5957@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 22:19:39
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 02:53:10 -0000



On 2020/6/5 5:32, Richard Henderson wrote:
> On 5/21/20 2:44 AM, LIU Zhiwei wrote:
>> +static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>> +{
>> +    if (!s->vill && has_ext(s, RVF) &&
>> +        (s->mstatus_fs != 0) && (s->sew != 0)) {
>> +        unsigned int ofs = (8 << s->sew);
>> +        unsigned int len = 64 - ofs;
>> +        TCGv_i64 t_nan;
>> +
>> +        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
>> +        /* NaN-box f[rd] as necessary for SEW */
>> +        if (len) {
>> +            t_nan = tcg_const_i64(UINT64_MAX);
>> +            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
>> +                                t_nan, ofs, len);
>> +            tcg_temp_free_i64(t_nan);
>> +        }
> I guess this is correct, but it looks odd.
>
> I would have done
>
>      unsigned int len = 8 << s->sew;
>
>      if (len < 64) {
>          tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
>                          MAKE_64BIT_MASK(len, 64 - len));
>      }
>
> and to match, I might use
>
>      MAKE_64BIT_MASK(32, 32)
>
> in trans_vfmv_s_f.
Thanks. It's much clear this way.

Zhiwei
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


