Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmV8c-0004x1-HX
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 21:53:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmV8Z-0004w4-J1
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 21:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmV8Y-00030i-7k
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 21:53:03 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36314)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gmV8Y-0002zu-1o
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 21:53:02 -0500
Received: by mail-pf1-x444.google.com with SMTP id b85so2235307pfc.3
	for <qemu-riscv@nongnu.org>; Wed, 23 Jan 2019 18:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=KMstAiFWIHuaIQvheXPBYyayN6JUmMLN01/HW3FYlso=;
	b=ScjPFIC7JkDa4DCI9Lq0dxDEwgSEI9B/PrTDxG4/wtmUrFLFtoDR0U7lx03Gu53qF/
	WqS/3fdYS2eCci9w1wKdFOU1YaGvKYdVfXLjcjpgcdIe34dFensWM8Z+yWA1fMiduUi0
	V/i+2+OJrvO5p9iTvvQEQvjO/hrm5i1vXQDNgVri5byb3PXKsVngxQHJjchtrkoFHdn3
	f+1LU1fyF1Y+6d21p1r82C12HanZKlJAmmAg++OlM4GPKVMgxay6ZUCeiq/bvbz1k0rE
	eDA+fA7K0MmeTRtF1rjSrrbAzg91xVKBKLJnHz0F0EYVwzZgohYDZUn25ah4qLUp9OO0
	peig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=KMstAiFWIHuaIQvheXPBYyayN6JUmMLN01/HW3FYlso=;
	b=QNcYV2vROwbBpDQscoGkn+7T+uilDh6z2Od5HFL8pUcQiqN2slJPPNNLLBe1hyB7u/
	hQZ3Pui7T5MKYpdlJl5yN9MXMW9ZtZ3ikZQsf8R+YEE8UEzFtmblseKIyskUowdx794L
	ADekJ2YD0wDHwxULbjbK/Bd5JyZ7+Qv9R5rOryc27oRFcrjG1q/23nCHeXvkHxY/dCGl
	tduncUxsGKA+vmZYC6FignOH1C30Y/PFN52CjPK/S2jWwmj1VGXyeuiFM6aPfvd27gRH
	L/fm3iKKST+Nmf1Ntv5Pxy5KCYgIJYESecg4r8vAe4BPaN34F5iATzT4OflAuRDnYaSe
	v2Fw==
X-Gm-Message-State: AJcUukef9lDQxw0tmWcem9OYU3+jU6ebhmfYDzGL30LgK8bVwGiss22y
	swGSAAcfrCGLU7CJJByTAznyFESoGRQ=
X-Google-Smtp-Source: ALg8bN508YFM5qWhzFeBjOOEfoum8CRg2SnfSqpoKcIzYW3og3bcBa6XiUSwBQiFrX0wIyq1jQPQ8Q==
X-Received: by 2002:a62:4851:: with SMTP id v78mr4669312pfa.97.1548298380533; 
	Wed, 23 Jan 2019 18:53:00 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	k191sm29955824pgd.9.2019.01.23.18.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 18:52:59 -0800 (PST)
Date: Wed, 23 Jan 2019 18:52:59 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 18:52:51 PST (-0800)
In-Reply-To: <CAFEAcA-yeQSbbhKXXJ0f961MJKC-v46DWgoaXcQUt64DZcdzqQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-2bd91def-4148-4180-bdbe-0be851d575e5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [PULL] RISC-V Updates for 3.2, Part 2
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2019 02:53:04 -0000

On Mon, 14 Jan 2019 04:40:06 PST (-0800), Peter Maydell wrote:
> On Fri, 11 Jan 2019 at 18:06, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The following changes since commit 147923b1a901a0370f83a0f4c58ec1baffef22f0:
>>
>>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20190108-pull-request' into staging (2019-01-08 16:07:32 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part2
>>
>> for you to fetch changes up to f7cdfa38f37e0985457ac03c3238861144a58b4c:
>>
>>   default-configs: Enable USB support for RISC-V machines (2019-01-09 17:34:10 -0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Updates for 3.2, Part 2
>>
>> This patch set contains a handful of Michael's CSR-related cleanups,
>> which should allow us to proceed with more outstanding bug fixes that
>> depend on them.
>>
>> Additionally, there is a patch that turns on USB.  This works for me
>> when the kernel has the appropriate drivers (which will soon be in
>> defconfig) and I pass
>>
>>     -device usb-ehci
>>     -drive id=my_usb_disk,file=usbdisk.img,if=none,format=raw
>>     -device usb-storage,drive=my_usb_disk
>>
>> to QEMU.
>>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
> for any user-visible changes.

Thanks for the reminder :).  I have an account now so the update should be in 
there, I'll try to remember to include it along with the PR next time.

