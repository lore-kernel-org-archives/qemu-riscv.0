Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvu2N-0001dN-IM
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 02:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pvu2M-0001d6-Gb
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 02:07:54 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pvu2K-0003j2-Qq
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 02:07:54 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6a5ec0d8d8aso2678138a34.2
 for <qemu-riscv@nongnu.org>; Sun, 07 May 2023 23:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683526071; x=1686118071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vOJb/nhupX+Uh0ZqeX7NZdVCl0gg4P4jZ9hT9Z/HYNQ=;
 b=RAcCXZjv1Y/kXu8g6S7Ez/Vxtq/nPkrwbt/43XBZSOKARGzNzpbybw72bnSORWuy1Y
 So9Q3vHqv5fMaZRMplvila506sUUKjDJgov7/IpMtwnvpjOzHe9G81OnTz4EHDYsJikb
 ba2Mgt5BbYwkDw+GrKPAANkRHpgyRfQUTMJ3AG12DKjyiXQurUC3174Fs1ODWc/t58W2
 eRcjIwT+a7KgqEZbtqH+iQgYI44OXTi709BanpMXYYYhIGrLqIxJOaYT4DZE4AT9dQ4c
 NZD1Nn2YcTmPO4xheE+gimoWuHYOp7u27eO+fl4Gr4ZaFporyTGFX7B/jCuIFrXlv0hd
 rxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683526071; x=1686118071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOJb/nhupX+Uh0ZqeX7NZdVCl0gg4P4jZ9hT9Z/HYNQ=;
 b=RqN7SdiLWUPIyS/L6L5DisJnXFlcwdTsl/muHsKLShIdvqkbrZyucbnM4Drrvrtzl8
 SYlakPEl9L1oQaBjvz1i3n+6TQv4499uwze1L6R0ZFR/mGN1YZEVrFPtkmUiXl+OpSCp
 7IWgMb9vrDSBlajZtvNVMEEZqAPrnA9cTjPb1E+yCOeN5RZwZ534ORLegxpbzAUEOxHZ
 gzjVYRcvXOCm2UZH6JHUjpROt8ssl8K3UT967cK2WuFwA1YR918O0Dr9oXE/M4Zvm1WN
 PMp5YEZgyno+1LtaxakKDVxtqShBoCa79yuRNK3wqpMKSCbR6BGTGaviU7Dy+8QYK9Eb
 tweg==
X-Gm-Message-State: AC+VfDxCdQZNPZnbw7Zk+DVcwvNwUNi3qVwlVZ0ntj5WtdwnUJN0FJ8Q
 sdHkMzZ1U/l4rxvzVOqr/SKA+Q==
X-Google-Smtp-Source: ACHHUZ6vJaF1Dr3AjxiFNttUOUHDTxLCRtRIkd4NLTyb/gDJ1KlIuy9ub0Vvyt/gYPtYILj9klzoDQ==
X-Received: by 2002:aca:210f:0:b0:38c:35b6:d028 with SMTP id
 15-20020aca210f000000b0038c35b6d028mr5194795oiz.36.1683526071366; 
 Sun, 07 May 2023 23:07:51 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.144])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a4ad0ce000000b0054f9f229bddsm78792oor.15.2023.05.07.23.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 23:07:51 -0700 (PDT)
Date: Mon, 8 May 2023 11:37:43 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZFiRr8d2zyAJlZJv@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 08 May 2023 06:07:54 -0000

On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
> On 4/25/23 12:25, Sunil V L wrote:
> > Currently, virt machine supports two pflash instances each with
> > 32MB size. However, the first pflash is always assumed to
> > contain M-mode firmware and reset vector is set to this if
> > enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > instance is available for use. This means both code and NV variables
> > of EDK2 will need to use the same pflash.
> > 
> > The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > variables also need to share the same pflash, it is not possible
> > to keep it as readonly since variables need write access.
> > 
> > To resolve this issue, the code and NV variables need to be separated.
> > But in that case we need an extra flash. Hence, modify the convention
> > such that pflash0 will contain the M-mode FW only when "-bios none"
> > option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> > This enables both pflash instances available for EDK2 use.
> > 
> > Example usage:
> > 1) pflash0 containing M-mode FW
> > qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > or
> > qemu-system-riscv64 -bios none \
> > -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> > 
> > 2) pflash0 containing S-mode payload like EDK2
> > qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -pflash <smode_fw_vars> \
> > -pflash <smode_fw_code> \
> 
> On amd64 and arm64 unit=0 is used for code and unit=1 is used for variables.
> Shouldn't riscv64 do the same?
> 
Hi Heinrich,

Is that a requirement from distros perspective? That was my original v1
design.

But the reason why I kept unit0 for variables, it helps in keeping current
EDK2 usage model work. Otherwise, current EDK2 will break if we change
the code to unit 0.

Second, since unit 0 for RISC-V is currently assumed to start in M-mode fw
which is secure, I think it makes sense to keep variables also in unit
0.

Thanks!
Sunil



