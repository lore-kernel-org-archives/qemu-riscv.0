Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pv1tk-0003Xj-2U
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 16:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv1ti-0003X0-BH
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 16:19:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv1tg-0001T0-L8
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 16:19:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso1504550f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683317959; x=1685909959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oX2MH8rkUaZwViiqoVzaThFDghPJE//PWA0J+d7lxhE=;
 b=GYYN5xRemSbBNnQKthpte1wMne6s9/zt9WkEUi1kjJsBaJL53D7+zfaTZZgxZGhmZ6
 snV+A1FgjWZE0Ek+CcEzsQSWNhOQCWLsUbZTQKIhUzMwHxwufrKKVCnXXdc+u/xX90+6
 asNmCCnLcQdJratCZF28pFpXkt7Fqhq10FxvYcSnJ5TbuKEB6lf/ggWaHv5+owPjmBzl
 V7CJNlMn6u/0O8k69Ymw3yCOnT71xbw6YsHUtLZn1ywSYiVvOtHeYrGTMqspulgoDJVN
 6a6NVuVSUvmTcPzsyl4AsRQ8cfV1hheu+Dg45Ldrn1U+U7GTLYOhhUQHhZedYwpZ5j8H
 I2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683317959; x=1685909959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oX2MH8rkUaZwViiqoVzaThFDghPJE//PWA0J+d7lxhE=;
 b=jpiFldmryG0FqMkGkUPRASMhh7Wo2BjwhEocjzo9F2kbMsV54axK05HJ4IYD/gihu7
 4ZLihTKyJ+0/eJop8+wkXhJL9hBhq/r/wlwqbVwxX0wLv26Sr8W2YS6/p/fLEQPojoAb
 7SDNAGhGQ7jHa1vkaSc8ItsXwKJfwIj9n9Vh3MO/S1RFcwygrQahvQ81qP+kYpi0QkDH
 +QBZNigWgac7AqdHJ6bIT5V6Ny/+d7lLtrLPRTB80BZxxmapTZG7cgO81U9YWMqDfYO5
 w1zK2VO7V+oeb1Ce9xS1FmBi/Zb6nbioR7eXeYFXeaSnSb1zhO9b/NNZOBN8ufuy+WZg
 m5rQ==
X-Gm-Message-State: AC+VfDxWDlEMBuf8aa19HhLy49YDdts58ls2Aoil+yhJ/Vhi56fKN158
 19pt0cSaWG6jt0vNSbnngHdxBQ==
X-Google-Smtp-Source: ACHHUZ5sjyv64Yi7uzozk2+1swrmigzY7Ucoa+aKGhpFxaHqgrkqORUu64nrjA4TqGvky85dALfhNw==
X-Received: by 2002:adf:e445:0:b0:306:283e:23a with SMTP id
 t5-20020adfe445000000b00306283e023amr2185121wrm.52.1683317958800; 
 Fri, 05 May 2023 13:19:18 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6101000000b003062b57ffd1sm3321919wrt.50.2023.05.05.13.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 13:19:18 -0700 (PDT)
Message-ID: <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
Date: Fri, 5 May 2023 21:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 20:19:22 -0000

On 5/4/23 18:17, Peter Maydell wrote:
>> +    case MO_ATOM_SUBALIGN:
>> +        tmp = p & -p;
>> +        if (tmp != 0 && tmp < atmax) {
>> +            atmax = tmp;
>> +        }
>> +        break;
> 
> I don't understand the bit manipulation going on here.
> AIUI what we're trying to do is say "if e.g. p is only
> 2-aligned then we only get 2-alignment". But, suppose
> p == 0x1002. Then (p & -p) is 0x2. But that's MO_32,
> not MO_16. Am I missing something ?

You're right, this is missing a ctz32().

> 
> (Also, it would be nice to have a comment mentioning
> what (p & -p) does, so readers don't have to try to
> search for a not very-searchable expression to find out.)
> 
>> +    case MO_ATOM_WITHIN16:
>> +        tmp = p & 15;
>> +        if (tmp + (1 << size) <= 16) {
>> +            atmax = size;
> 
> OK, so this is "whole operation is within 16 bytes,
> whole operation must be atomic"...
> 
>> +        } else if (atmax == size) {
>> +            return MO_8;
> 
> ...but I don't understand the interaction of WITHIN16
> and also specifying an ATMAX value that's not ATMAX_SIZE.

I'm trying to describe e.g. LDP, which if not within16 has two 8-byte elements, one or 
both of which must be atomic.  We will have set MO_ATOM_WITHIN16 | MO_ATMAX_8.

If atmax == size, there is only one element, and since it is not within16, there is no 
atomicity.

>> +        } else if (tmp + (1 << atmax) != 16) {
> 
> Why is this doing an exact inequality check?
> What if you're asking for a load of 8 bytes at
> MO_ATMAX_2 from a pointer that's at an offset of
> 10 bytes from a 16-byte boundary? Then tmp is 10,
> tmp + (1 << atmax) is 12, but we could still do the
> loads at atomicity 2. This doesn't seem to me to be
> any different from the case it does catch where
> the first ATMAX_2-sized unit happens to be the only
> thing in this 16-byte block.

If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be 
(separately) atomic, and we return MO_64.

>> +            /*
>> +             * Paired load/store, where the pairs aren't aligned.
>> +             * One of the two must still be handled atomically.
>> +             */
>> +            atmax = -atmax;

... whereas returning -MO_64 tells the caller that we must handle an unaligned atomic 
operations.

>> +    /*
>> +     * If the page is not writable, then assume the value is immutable
>> +     * and requires no locking.  This ignores the case of MAP_SHARED with
>> +     * another process, because the fallback start_exclusive solution
>> +     * provides no protection across processes.
>> +     */
>> +    if (!page_check_range(h2g(pv), 8, PAGE_WRITE)) {
>> +        uint64_t *p = __builtin_assume_aligned(pv, 8);
>> +        return *p;
>> +    }
> 
> This will also do a non-atomic read for the case where
> the guest has mapped the same memory twice at different
> addresses, once read-only and once writeable, I think.
> In theory in that situation we could use start_exclusive.
> But maybe that's a weird corner case we can ignore?

We don't handle multiple mappings at all well.  There is an outstanding bug report about 
read+write vs read+execute mappings for a jit -- our write-protect scheme for flushing TBs 
does not work for that case.

Since we can't detect the multiple mappings at this point, I'm tempted to ignore it.
But you're correct that we could drop this check and let start_exclusive handle it.



r~

