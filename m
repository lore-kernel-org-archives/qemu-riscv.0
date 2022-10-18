Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okiqP-0000Tu-Ki
	for mharc-qemu-riscv@gnu.org; Tue, 18 Oct 2022 05:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okiqO-0000Qt-6t
 for qemu-riscv@nongnu.org; Tue, 18 Oct 2022 05:25:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okiqI-0002ga-J6
 for qemu-riscv@nongnu.org; Tue, 18 Oct 2022 05:25:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id v11so284455wmd.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Oct 2022 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Mz6i7ESZ2TFnorovF5qm0C/6hkSs67iE/sk7bxEies=;
 b=RyDuQJGb5zKxTnxr3e10gv90nRd58mT0L6piz7qfiMrcv4Yl63y/S3vfkdIchP7tlO
 hwPL662imsoUHCfU1B0BzeWOC/JsmDFjCXHaX7DF9GUcjSAP5gT7oHhQqHlh0pQBbTh/
 dTKD+XX4Sq/bJ3lwkxLBGJRJHW23aIOEXrcxvExmyBmUGCtKAG1ytOhsKzO5gZMjmqAn
 mXH+E2ox/GGSUmVEaWkNULCksjojcL0pNJQxs/oAB76vkVo2VYfGTk6S9H3GxFm6ZQdV
 IASk/3Ue4wy7MbEqU1SxzSeB6lL61snNiMHzKQ3qc5wgPnIJC9xpFidiD9iETK8a+xX1
 oWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6Mz6i7ESZ2TFnorovF5qm0C/6hkSs67iE/sk7bxEies=;
 b=QJBNfvE+iUVF9b6TJJOEyj8sBLuHNcaqYhvxlGEJfXcu65xhQD3Drkiodj5MVE0MKJ
 mLeY1HQXxIcDLL6Y8QFN90iCXHn88yD0lzS9Q+L/MX1oJkTVphNCoZSzDUpmjmP9wRk+
 Et+Vf0aZp52tsEF/evmfuuL8KiTt9AQrj/L0CdM9AGcD+XkBRlpDjRn1vyiEzF/UMvpo
 o39jtrUUfRGaY/V8HAfHwbh8TDboI99Cta4ePOUm7SP9PdTmBAW2YPP3aCzU5JVR9i2m
 JfLxeS1ikuHER0Ky2m9GwZix7ynk0qnkgvCU+iVhrMpSbYMnI8ncEhi6RbkPVS4gdeEA
 pApw==
X-Gm-Message-State: ACrzQf2t+n8qtnjGoF722pj4MwiwbzJGjejyc4eb/QcKEfa1Ru+CdvjW
 xKiE1ALiWDDWHAIpbfOql1RGWg==
X-Google-Smtp-Source: AMsMyM6cjg8YBzGtGAyux1pU2nyC+FhrWERL8YlQ5ZwdOTFekUJZp+kaQRJBaqNWQNX1TwB258rJ6g==
X-Received: by 2002:a05:600c:1906:b0:3c6:f154:d4b5 with SMTP id
 j6-20020a05600c190600b003c6f154d4b5mr1267479wmq.94.1666085096930; 
 Tue, 18 Oct 2022 02:24:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b003c6c1686b10sm19661693wms.7.2022.10.18.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 02:24:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC7F81FFB7;
 Tue, 18 Oct 2022 10:24:55 +0100 (BST)
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
 <87lepeeno0.fsf@linaro.org>
 <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
 <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
Subject: Re: Question about TCG backend correctness
Date: Tue, 18 Oct 2022 10:22:28 +0100
In-reply-to: <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org>
Message-ID: <87v8ohcwm0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 18 Oct 2022 09:25:04 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/18/22 01:27, LIU Zhiwei wrote:
>> Maybe I can run RISU on qemu-aarch64(x86) and qemu-aarch64(risc-v)
>> to check the RISC-V backend.
>
> This is a good start for debugging a tcg backend. It's not
> comprehensive, because RISU executes one instruction at a time then
> raises an exception to check the results.  This means that the tcg
> optimizer doesn't have much to work with, which means that the tcg
> backend is not as stressed as it could be.
>
>>> I've long wanted to have the ability to have TCG unit tests where a
>>> virtual processor could be defined for the purpose of directly
>>> exercising TCG.
>> We already have many ISAs as the front end of TCG. Will the virtual
>> processor here be some
>> different?
>
> It wouldn't.  This is my argument against creating a new virtual
> processor.

I'm not wedded to the idea - but it could be a super simple processor
with a lot less extra baggage than a full ISA - purely for throwing TCG
ops at rather than decoding any machine code.

> I do think we should be better about creating regression tests for
> bugs fixed, in the form of small focused assembly test cases which get
> run via check-tcg.

Can we detect optimisation failures with guest tests? Have we written
any so far?

Is it worth doing anything to lower the barrier of entry for these small
micro tests or is the current check-tcg framework enough?

>
>
> r~


--=20
Alex Benn=C3=A9e

