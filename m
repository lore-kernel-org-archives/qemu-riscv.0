Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i98Zg-0002Ut-3M
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 09:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i98Zd-0002Tf-Ij
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 09:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i98Zc-0007mH-IC
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 09:58:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i98Zc-0007le-DX
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 09:58:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so19774676pfb.12
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 06:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=b8w7tH9B6Pgk41EpycnXY5kJ6zOJOQmDNW6abSEPV2k=;
 b=tCdbl+K+3VcSZY1Xgvr/vm8pwuJcEBfFo76x2uXoGTicYF8vHjTSFQws0EJL5qfca8
 z3gjcNbLGJQUOLwvWoHOWGgFtk/zWBAb+fVcb93BHt2xDNW7H1obzHEtS7qybtN/12sL
 OWQ3qRjfLqQnJ+HeJaMWQT2jPA5CwmUxh/RfZ73DJWbD9SBR6oAHD73lEpBmbe7bQ991
 zDyIGkoOfuVLu471LvXvFvVBBXJRXC35/sdGt5o7cZXqRBgU0tSm5tEMwH6pnVFcNv/C
 Hgy1459gZeQO7Jd/nmE3t/dhHsIxbGQxLQy+U1aBgVzHvIRm7i5nELUjsc30sZUbsG3Q
 PjAQ==
X-Gm-Message-State: APjAAAV8iXNqUQIx82e2Z63iKlKPLyPxHHBv1Y/wFxZPQdGtWaqSRZjH
 M1bqSGMlzyW3OOCkaBqgyas2CA==
X-Google-Smtp-Source: APXvYqyG6UUFOZIeybCewgFHHwr4T0u/OlbdOaJGig9370eRos8SxNn7YD53UwOD0blWyYLz6CTPFg==
X-Received: by 2002:a17:90a:c20c:: with SMTP id
 e12mr11320430pjt.14.1568469526257; 
 Sat, 14 Sep 2019 06:58:46 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id 127sm62651466pfw.6.2019.09.14.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 06:58:45 -0700 (PDT)
Date: Sat, 14 Sep 2019 06:58:45 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 06:57:39 PDT (-0700)
In-Reply-To: <ac250aa8-886f-befb-070f-2f5d10861e39@linaro.org>
CC: zhiwei_liu@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 riku.voipio@iki.fi, 
 laurent@vivier.eu, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-5091386d-7dcb-4425-b56c-662581775593@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 03/17] RISC-V: support
 vector extension csr
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
X-List-Received-Date: Sat, 14 Sep 2019 13:58:50 -0000

On Wed, 11 Sep 2019 15:43:29 PDT (-0700), richard.henderson@linaro.org wrote:
> On 9/11/19 2:25 AM, liuzhiwei wrote:
>> @@ -873,7 +925,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>      [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
>>      [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
>>      [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
>> -
>> +    /* Vector CSRs */
>> +    [CSR_VSTART] =              { any,   read_vstart,     write_vstart      },
>> +    [CSR_VXSAT] =               { any,   read_vxsat,      write_vxsat       },
>> +    [CSR_VXRM] =                { any,   read_vxrm,       write_vxrm        },
>> +    [CSR_VL] =                  { any,   read_vl                            },
>> +    [CSR_VTYPE] =               { any,   read_vtype                         },
>
> Is there really no MSTATUS bit to disable the vector unit,
> as there is for the FPU?  That seems like a defect in the
> specification if true...

The privileged part of the V extension hasn't been written yet, which is part 
of the reason this is a draft that we know will change.  We're letting it into 
QEMU so people can more easily prototype software, but won't be letting it into 
Linux or GCC to avoid users depending on behavior that will change in the 
future.

