Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWlYM-0003lf-EZ
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 17:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWlYF-0003XK-7B
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 17:00:59 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWlYB-0002A3-7C
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 17:00:54 -0500
Received: by mail-pj1-x102d.google.com with SMTP id c23so7687399pjo.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 14:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kY2qXRh3ybL8nxlU7ApPM5E+rp6yddmUTu4Cu6SGmI=;
 b=qmcN3cyAuN5EgWOw0yGlzKqIp9doylY/r+FqBoxy6Hg7VEEr6lYTsPPPrSVhqLokJF
 qDQq8QmD6KA05Nk+ORUexLaG6k9Y0PM/QAoozI34YuxTBBHJan2tVXOdoNd2U/7TMYSF
 NToStwhHJbx6feTHyafl/zXBIVal4F/mmHQYX5nxXtcXY8dvhw1R5AIAzzQ5vGOT9Nlb
 uDYUdtCHxUBAwMAV6sl2x1OwrMQif71uBESg+MQghyMU36i+eGPTiymXzWQHRtc0W3Mz
 EGlxDF0lGtWASZ/wpO5XIDps2GIJxOysj5rqUOoFsDdqiNSL9y5ZMqF6Xl+z/nq4kkxt
 ghgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kY2qXRh3ybL8nxlU7ApPM5E+rp6yddmUTu4Cu6SGmI=;
 b=ZL1c/kvXWp0dwjRyKMjsagQ0mcVAR8R9RxrsPUcxReve1ByxsQXu+VCfLrKDe8glRB
 Ax1eRt2gt4Hd1+c41gqJjJ353hGstmhIHYHnQXgAeg1wqfH/GnemzvxhYuTIRhhm3RhL
 RdGeslVHZq2HKwNjKHF6vIzQdjyJ/JvFXMzObNjOWk+trVmJb5KpRbvOAQmxFeXtpAca
 a8FhUlPJSX9L6Y7UOTP/HCLovKxZ4NQ9+9dVceXsHkCrKeeN6tKiooOEM2ePTotIRwEa
 Jj56bQUx6j0hKBPALGtDR7H2A+ey4BuPZZ6TRzMV5YjftlBGruKZZBtc7mhW0QbuE45j
 M+2A==
X-Gm-Message-State: AO0yUKWl6uWebnh9IzhQDT8j8Dh8nW4g06ybKxBKlcv0cBfoGdI4G7BW
 Zm710QvBaVS6C+n7oNFL0EcXpQ==
X-Google-Smtp-Source: AK7set97N0wiSVsqc37+X857dlSd4MgtA6NtmWhUgE4mo8fulOpLshVUjv7y0VjQymNHgvTMUTwcxA==
X-Received: by 2002:a17:902:ec8a:b0:19c:c8c8:b545 with SMTP id
 x10-20020a170902ec8a00b0019cc8c8b545mr397981plg.50.1677535249255; 
 Mon, 27 Feb 2023 14:00:49 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902bd8900b0019a73faf773sm5084398pls.71.2023.02.27.14.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:00:48 -0800 (PST)
Message-ID: <b80bcdd5-d64c-0d90-151c-bc73257744bc@linaro.org>
Date: Mon, 27 Feb 2023 12:00:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "gaosong@loongson.cn" <gaosong@loongson.cn>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "ale@rev.ng"
 <ale@rev.ng>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-20-richard.henderson@linaro.org>
 <SN4PR0201MB880877A0320F4E445033484DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB880877A0320F4E445033484DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Mon, 27 Feb 2023 22:01:00 -0000

On 2/27/23 11:55, Taylor Simpson wrote:
>> -        HexValue mask = gen_tmp_value(c, locp, mask_str,
>> -                                     dst_width, UNSIGNED);
>> +        HexValue mask = gen_constant(c, locp, "-1", dst_width,
>> + UNSIGNED);
>>           OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
>> -            &mask, ", ", &mask, ", ", &shift, ");\n");
>> +            &res, ", ", &mask, ", ", &shift, ");\n");
>>           OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
>> -            &res, ", ", value, ", ", &mask, ");\n");
>> +            &res, ", ", &res, ", ", value, ");\n");
> 
> What's the advantage of putting the result of the tcg_gen_shr into res instead of mask?  Is there something in TCG code generation that takes advantage?

With this patch, mask is read-only, so a write to it is illegal.


r~

