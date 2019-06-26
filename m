Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg3LU-0005rn-AB
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 04:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg3LQ-0005qV-3L
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg3LP-0008Ea-40
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:31:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg3LO-0008Dc-Uj
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:31:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id c13so876343pgg.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 01:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xpkB33jinwT4ATtBFOv4jybsidxDTYPFps6HY6FF87s=;
 b=nWf6fBUgIMvaqcAt3J3UhfOu1xGFquOTCt37jWtowWXg5zIi+mZjMEdAzC3Hc1zuWx
 /aY8DgsUa1hTYTcPb1rSX7rIgeAIlnXtxJ+Qtx0DKp5RjPTD6e06MstFYUVf9dSi/Bwr
 F7cgCY8TAM8Pr1LhRqyjBuTjofYc7BGxYDeIIHtKD+z6/mMLj8j0i2/ZyhO4EgTSFlIi
 Nmwo/r9r6xR2yWE/JGBkAtuiX6rOApMxG8LdIbJvTwA8c0+FQCEky9Ok9PqKSIbsC/VI
 VV9bYoVuPhOp9lQtJOkrDkQtnxSdRzi+z8QymgHuei6Jps0dyUMN8H/giozNs1pFjPIM
 ieXA==
X-Gm-Message-State: APjAAAX6Q7hJkqJeFzqIBAk0IcX/ZcKIIgyBEGRbiFNi6/7TX+Knm1MF
 oWSP41vDJmJKquzypkqt+jTHaA==
X-Google-Smtp-Source: APXvYqxgGnZV+BTlb+7uwRMI2mgKZEB0znw2F4ZiRPu6mPhxsRIXoV7k9cMaZx6+1qSuR7x6/Zzztw==
X-Received: by 2002:a63:2310:: with SMTP id j16mr1863717pgj.238.1561537913693; 
 Wed, 26 Jun 2019 01:31:53 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id h18sm11451962pfr.75.2019.06.26.01.31.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:31:53 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:31:53 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:31:49 PDT (-0700)
In-Reply-To: <77792d70-b438-df37-6fe4-b5723f7da99d@linaro.org>
CC: joel@sing.id.au, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 me@carlosedp.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, marco@decred.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-5938add3-68fb-43bb-b0cb-60fd330a8866@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
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
X-List-Received-Date: Wed, 26 Jun 2019 08:31:58 -0000

On Wed, 26 Jun 2019 01:30:35 PDT (-0700), richard.henderson@linaro.org wrote:
> On 6/26/19 10:25 AM, Palmer Dabbelt wrote:
>>> You misunderstand.  The code is exactly correct as-is.  The alignment check
>>> happens implicitly as a part of the softmmu tlb resolution.
>>
>> Sorry, I thought you said it wasn't happening for linux-user?  If it happens
>> for both then we're good.
>
> Oh, that.  No, there's no better way for linux-user.  Though honestly, if we're
> going to fix this, it should be done in tcg/* rather than adding hacks within
> target/riscv.

OK, I'm fine punting on it for now.  If I ever get time to fix it up then we'll
attempt to do so genericly.

Thanks!

