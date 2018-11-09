Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gL4QV-0003Rj-Ez
	for mharc-qemu-riscv@gnu.org; Fri, 09 Nov 2018 05:54:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gL4QS-0003Q0-VE
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 05:54:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gL4QR-0007s9-CT
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 05:54:08 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gL4QR-0007rK-6R
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 05:54:07 -0500
Received: by mail-ot1-x342.google.com with SMTP id t5so1251129otk.1
	for <qemu-riscv@nongnu.org>; Fri, 09 Nov 2018 02:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E2Qip3uSyHgJsPrL4AGog8WuAMrtY6u9cWRKh/xrhWw=;
	b=G0TOkz9sCNaZ2URRFeFy6HKhLCeVRHg7rLfKIgir+tPrxa4IdJ17xL7Gjp/aT+Hdvj
	UxuOfB9FEpeU+zjLMTlawss4MV66ZlLt+wGX4e6ez8dbxtdvstxr1wqxgMmV5CjT6T5C
	OYYgVBaogmkVoDQ3Ts0JVv0S9/EEBhhvAWCWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E2Qip3uSyHgJsPrL4AGog8WuAMrtY6u9cWRKh/xrhWw=;
	b=sWD1pWp217lt3JB7AWZk0jDW0RYLJilmJGfkzI6TFbMD/3oMp3HutQFERLWh7vqlLd
	S3PMULROiVWJhLTWncaicXWkq52UJo9tG1xKTHhkOUJ/tqvvvcDW/fwDwxgJl31IKWiJ
	TWFj0oNVbce7XFGVYj0V2dtHfolzPARUNII0+IMK+AVh21BObwQjrJSPTphU56Jk+zuX
	Jy75lGdBe+FBm9mCNLBAGFB5VI/Z93v8w9zMLvIYkj54xQfFz06dzxfDJYZFF5dQwHx/
	LOCFq1YTd6nI4JSgMh2J7MbjvhlGHs96rfoXggedFw6GxYSc8Xp87gru6dHu42+cYG3+
	hKCw==
X-Gm-Message-State: AGRZ1gJGcCN5onCdGwpxAguKz/caDG4ozF7gMaZcNSloaoL9QarDdwyo
	KjdtMbWqPa2TcZ9fTwr4k4zfKNH/Rm8BxkhMeK2lzw==
X-Google-Smtp-Source: AJdET5c47BuubiiCdKIjY+pitbEEd9ilFrt6TXI+RXPaiG5vVq4YaguGX2u6tFgBZm4lsltKrm/hRDo9n8Ljqs4Yhc8=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr4596802oti.151.1541760845864; 
	Fri, 09 Nov 2018 02:54:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Fri, 9 Nov 2018 02:53:45 -0800 (PST)
In-Reply-To: <mhng-10e50b53-fc97-4315-9a4d-6934d7acd223@palmer-si-x1c4>
References: <CAKmqyKPHDx7iTQRaY7+5v13oE-ARzpqFDOo4e98Y4bHGH7s+Ww@mail.gmail.com>
	<mhng-10e50b53-fc97-4315-9a4d-6934d7acd223@palmer-si-x1c4>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Nov 2018 10:53:45 +0000
Message-ID: <CAFEAcA-nxzDGCPEXzWTf4MrJYc8nWk5_hxvczm26=V8O9K60vg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>, qemu-riscv@nongnu.org, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL] A Single RISC-V Patch for
 3.1-rc1
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
X-List-Received-Date: Fri, 09 Nov 2018 10:54:09 -0000

On 8 November 2018 at 18:52, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Thu, 08 Nov 2018 10:38:51 PST (-0800), alistair23@gmail.com wrote:
>>
>> On Thu, Nov 8, 2018 at 10:35 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>>
>>>
>>> The following changes since commit
>>> a7ce790a029bd94eb320d8c69f38900f5233997e:
>>>
>>>   tcg/tcg-op.h: Add multiple include guard (2018-11-08 15:15:32 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc1
>>>
>>> for you to fetch changes up to 00a014ac01feac875468d38c376f7e06f050f992:
>>>
>>>   riscv: spike: Fix memory leak in the board init (2018-11-08 08:41:06
>>> -0800)
>>>
>>> ----------------------------------------------------------------
>>> A Single RISC-V Patch for 3.1-rc1
>>>
>>> This tag contains a single patch that I'd like to target for rc1: a fix
>>> for a memory leak that was detected by static code analysis.
>>>
>>> There are still three patch sets that I'd like to try to get up for 3.1:
>>>
>>> * The patch set Basian just published that contains fixes for a pair of
>>>   issues he found when converting our port to decodetree.
>>> * An as-of-yet-unwritten fix to the third issue that Basian pointed out.
>>> * A fix to our fflags bug, which is currently coupled to some CSR
>>>   refactoring that I don't think is OK for 3.1.
>>
>>
>> There is one more patch fixing a memory leak in the virt board as well.
>
>
> Oh, sorry about that -- I thought they were the same patch!
>
> Peter: let me know if you want me to submit a new copy of this PR with both
> patches or a follow-on PR.  Sorry for the noise!

As it happens, I'd just run this pullreq through testing overnight,
so I've pushed it to master; you can send another one with the other
patch.

thanks
-- PMM

