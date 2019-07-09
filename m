Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hkliB-00024T-SL
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jul 2019 04:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hkli9-000245-Rn
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 04:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hkli8-0002D6-Tz
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 04:42:53 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36290)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hkli8-0002Cf-M9
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 04:42:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so18751621ljj.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2019 01:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cPf0d2wTAJY5YS4rWQhBSWq2io4ceTTFA1ysSpT6pqg=;
 b=RRcMsONXJINomcIRzQnurZGFyR/OrCnmR/iR88hJHWflm3BHjBAH2f7Y2HIAdHqmdl
 GPYHtB2V+tCZXUlH+tZlwsQz24ZKs6zNDjNgAJregS6yb9aEgXwZJVvH8PEbUB2L4xqM
 pFKxldEP8rrFC7LlcwhIWHWoObtwAuEmelzz6eNhbFOTrC6NcH6C3UiTiMsmwb8UDapJ
 JQMaoQAW8wkv3gvwk+e/D8JOdVyS109mi8UXZjVDO0EwZkCpoMQgOSLSp9nQpEHWcNkY
 GZP2wlzQgMLelzfOUxsKSAidgNVNUi0Lp+YnmCZPihIdDCVMo0A12koLWH+bG3NhDxv1
 A+xg==
X-Gm-Message-State: APjAAAW5P5jq3/Ao6J2Aejww4zhgxbTppCq7P0gT7dP2BIjo6ZcSP8GB
 DRaMWhN/om5wm6xO4iaSGlVWsQ==
X-Google-Smtp-Source: APXvYqy41qd1KxNUxB0gp728wcOiPWqEsZwHMWTood2xWsRLj592Dh28zy75OlUnpgC3o8UBLU21Lg==
X-Received: by 2002:a2e:9b4a:: with SMTP id o10mr13355936ljj.137.1562661771152; 
 Tue, 09 Jul 2019 01:42:51 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id z25sm1909232lfi.51.2019.07.09.01.42.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 01:42:50 -0700 (PDT)
Date: Tue, 09 Jul 2019 01:42:50 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Jul 2019 01:42:46 PDT (-0700)
In-Reply-To: <CAFEAcA8Bf4Zt4U6p3uMsn8cwv+=7ZHxOt7y2FZzB8TYkyo8AHA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair23@gmail.com, stefanha@redhat.com,
 codyprime@gmail.com, 
 bmeng.cn@gmail.com, pbonzini@redhat.com, anup@brainfault.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-115240ce-f484-4ad9-ad3a-2103abfb1579@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.193
Subject: Re: [Qemu-riscv] [PATCH v1 0/2] RISC-V: Add default OpenSBI ROM
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
X-List-Received-Date: Tue, 09 Jul 2019 08:42:55 -0000

On Tue, 09 Jul 2019 01:37:08 PDT (-0700), Peter Maydell wrote:
> On Tue, 9 Jul 2019 at 09:35, Palmer Dabbelt <palmer@sifive.com> wrote:
>> I haven't looked at the code yet, but as the last one was fine it's probably
>> OK.  My only issue here is the timing: it's after the soft freeze so if I
>> understand correctly we're not supposed to take any new features into 4.1.
>> That's kind of unfortunate because it's somewhat unobtrusive and super useful.
>>
>> Peter: would you be OK taking this some time later this week?  I'd want to dig
>> through it and then bang on it a bit first.  If not then I'll queue it up for
>> 4.2.
>
> The first attempt at putting this into master got onto the list before
> freeze, so it's OK. Plus this clearly will only affect users using the
> riscv boards, so it's a limited-scope change. So I think we're better
> off putting it into 4.1 rather than not, assuming you're happy with
> the level of testing it's had.

Awesome.  I always test stuff myself a bit, but with any luck I should be able
to get a good look at it over the next few days.

