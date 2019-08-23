Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1IIT-0005SM-AY
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 18:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1i1IIR-0005SA-23
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 18:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1i1IIP-0008Uo-RH
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 18:44:38 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38683)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1i1IIP-0008UN-LQ
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 18:44:37 -0400
Received: by mail-pl1-x642.google.com with SMTP id w11so5899010plp.5
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2019 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cducK59MBXKJ93r1KVnBEFpVm8bq0VHnRhixw0q769Y=;
 b=Qe/nssV5hSuvS3NIGru5v0fsqFWxURlLf34VzNK6NOJbuF/JObobR6peqVPq8fgfpb
 lkRaqskqMWH7G/uNlgbugQDuXusPL/BQ9Fg2N6+aUhP6RAVNRXlQRf+N28itBxCZLcQi
 V+sByVRPKxQFfMopt76I3ZH9bkqJf603BqdS67mB086gPrD/a8UUp79ibVH4rMHF+Jv6
 av2OOb5vfM49uZcrciyKeXLM/vr+V1Oh70TnUxka5NP5M7kZNCWp2Tf2VHf84iETO8H9
 fp0xi2EK9n9K5jeqb3nOqwYdi1r+JUxpM6boRrz1ErmaVl0FGQ1lr0tnW6jscIKg15L3
 ywSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cducK59MBXKJ93r1KVnBEFpVm8bq0VHnRhixw0q769Y=;
 b=ote044GPsxEV3qo7+bREtpM+7kThI3q61aa+NZOhA3IfVr5RUFLlxO6wCfr8sBUM4P
 u2kiXok1NIDP4ZKvbGPagaWw7pcMKN1y9VYted6xUqeA91eJ0aA+MvPI8SA2c1KDekpJ
 PfcifBXaAe08SZaoQmBajpOyCNHmnHamd34560VmZlTyHFTp22DXyDuCRvTZe+6dbJjd
 Lv/xza/H1bsRMdSE3QD1oTOZWuoCvpHPMmR6xl+1KpuMlbYO4ZUwpeqC4Sv2oElsVq7u
 DAtAvNqvHVKl6KDxUz5uwCucrxGzVAC71x0Dyv/bkFwFViGSp91IjFWgHMZjzN75W0rK
 pd5w==
X-Gm-Message-State: APjAAAXY1xGe6GBVbly1Af8JJMgEoOdc1Bgv6mBljqNk+HsaU3RxzSd6
 b9sQ3HouRyIRGLOwiyqVklrxEl67K3E=
X-Google-Smtp-Source: APXvYqy+6t67MWGYJz+ST908fmjspnudLBlqogElHwI11DRdhN7AABuiItUP8liOaNPvVlICvOc9sQ==
X-Received: by 2002:a17:902:a50b:: with SMTP id
 s11mr569362plq.44.1566600276169; 
 Fri, 23 Aug 2019 15:44:36 -0700 (PDT)
Received: from [10.17.0.199] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 65sm4746032pff.148.2019.08.23.15.44.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 15:44:35 -0700 (PDT)
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
References: <20190821162831.27811-1-georg.kotheimer@kernkonzept.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <bee5ed64-7a65-c303-9cb6-8efcf4f8daf0@sifive.com>
Date: Fri, 23 Aug 2019 15:44:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821162831.27811-1-georg.kotheimer@kernkonzept.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [PATCH v3] RISC-V: Select FPU gdb xml file based
 on the supported extensions
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
X-List-Received-Date: Fri, 23 Aug 2019 22:44:40 -0000

On 8/21/19 9:28 AM, Georg Kotheimer wrote:
> The size of the FPU registers depends solely on the floating point
> extensions supported by the target architecture.
> However, in the previous implementation the floating point register
> size was derived from whether the target architecture is 32-bit or
> 64-bit.
> 
> To allow RVF without RVD, changes to riscv_gdb_get_fpu() and
> riscv_gdb_set_fpu() were necessary.

Reviewed-by: Jim Wilson <jimw@sifive.com>

Jim

