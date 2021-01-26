Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4J2B-0000xF-VS
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 02:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4J25-0000tE-Vp; Tue, 26 Jan 2021 02:45:05 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4J24-0002D1-9i; Tue, 26 Jan 2021 02:45:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id d22so18600850edy.1;
 Mon, 25 Jan 2021 23:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R0iR+/yHx68i0iee50nfClSuj2+Oehbx9Uj95gCYT+I=;
 b=SbbUT39cuxBACJbfHbZRzpqHyaSyJ+29OoF9L0fa8CWtg9Q4jm1bfsYuxv8XIb8q4E
 gae0JCdB4VNgih4MIP5hM/f7CNNyqsUAYxm/aC3hPHuuN7yLecm1USRddT+50OgHYkux
 9nY9we9ioRbSLBx6Zvg20ySy4wmdWF2nvJAEfq6S4qGJykRAZDkhLKyEragHRqYQFi/O
 Tugt8Gjat7POsSejGTuQSGdxMCBcyL7wC1TMiZ0wZOANQKGNCasA6nUKj4EBweJD02gj
 8E3o68cO6WVPZFsjzIFHDuWlYEVIgyjmD9UeFAo1mxuBDQoFZgWmi9+E6/YN80A25z6h
 a+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0iR+/yHx68i0iee50nfClSuj2+Oehbx9Uj95gCYT+I=;
 b=H3z3VJXmr9ZKqPd+fXSnLSIjBl6xv2a9cTlGmPK0HtZ157peuUCeylMnzKP77AbXzD
 xNg15/j//FP5WaOP3ehxCF69IXJL+OwlzZKZlqNe4hHMyvSsUqVzd//QdnlJT+4nCZR3
 WM2/g9Ib4+vjkdaHvWzSGCXAyGtY1S8gMjFEw9xqs+4MJb3Vk5eovzPVxGblJxhE2Rnk
 FunzOfMqdvPDVOi2CqUEBiGuRf0yquPBqVwlvwgBNHN43yZkQLjyrxe827FMMgstEmfm
 l/cWAKBDaYlys6VcyQ0g6Z91NBcx7zZ5/6UDt0ZI7wjjB9rESsHcprAKBjfXaks7A4rG
 WE6A==
X-Gm-Message-State: AOAM533RdnoK3OS1Pgp5/aAfFSRZoYJUuHj6K7SH05sLjylZem55tyb5
 kggNfIF9RXjJfM/fO1q0PTM=
X-Google-Smtp-Source: ABdhPJzU798haAkxHHfWvL/3aliIEvi5F/b3DB6jOrj19WTDAmk6FXwZeYhg0AYBBvRvpSXHnyycdA==
X-Received: by 2002:a05:6402:215:: with SMTP id
 t21mr3527235edv.363.1611647097798; 
 Mon, 25 Jan 2021 23:44:57 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a11sm11882119edt.26.2021.01.25.23.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:44:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 06/25] util: Add CRC16 (CCITT) calculation routines
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-7-bmeng.cn@gmail.com>
 <b9c150df-00e4-c785-1e89-dc135a51f4ac@amsat.org>
 <2927f234-a9d0-8fd8-c99e-b858aed1287c@linaro.org>
 <a87dbd17-b6cb-ae0f-10a8-9617c49a807f@amsat.org>
 <21456d3c-559e-3ea6-bc5e-2abcfa088da0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94d4b459-61e5-a65a-becb-955500c8da37@amsat.org>
Date: Tue, 26 Jan 2021 08:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <21456d3c-559e-3ea6-bc5e-2abcfa088da0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Tue, 26 Jan 2021 07:45:06 -0000

On 1/24/21 10:41 PM, Richard Henderson wrote:
> On 1/24/21 10:24 AM, Philippe Mathieu-Daudé wrote:
>> On 1/24/21 9:07 PM, Richard Henderson wrote:
>>> Doesn't this get put in libutil, where it is only pulled from the archive when
>>> needed?  Also, libutil is built once, not per-target.
>>
>> Hmm I just sent a pull request with this change squashed in.
>> Should I cancel it?
> 
> I guess not.
> 
>> My view is we don't install libqemuutil.a anywhere, so why overload
>> building unused objects when some configuration don't need it?
> 
> My view is that util/meson.build should not be overly complicated with
> conditionals.

Well I do see an impact when building on slow hosts.

> If we were building objects per-target, that would be one thing.  If we were
> doing --whole-archive, and including unused code in the executables, that would
> be another thing.  But otherwise...

I understand your position :)

Thanks,

Phil.

