Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppidn-0000Ee-Jw
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 00:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ppidh-0000Dw-8m
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 00:44:53 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ppidf-0002uA-KC
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 00:44:53 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6a5fe25d190so1462014a34.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 21:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682052290; x=1684644290;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RhZuUb2HeJ5mB7PiyqC19ou7b7kxLTEcd/LF9lTLOtE=;
 b=pWyxikYF1jDTAmBomI/gWbJVGauy1NW23EgrdUoqwzRS1JU1mLlK7id2pd5VzuCMlr
 Pvdj1yUbkCpD6UMO9SGkPDjU1tW8uafc+tCouGv2paJDnmfqHxOhdGYprafYjbVf+UyI
 sa0fNoxKGuoFdsWNf0gVp/9B8uSZQgUuG/PgkJzE+jCxoFnafGsZ2ayEUhPwKI+9TX0i
 Fla1TJ7acoxQOtvVOjw/ZVJ5b5AafuEfgG3eUKpgj2Ozr4O79sIsoZfszwFkJJw7Lr0j
 T23kXgg/pJlxlI69Pr0D6D1QEhw9fRdOt67iudk60qZmmW8Lcp2ozJX5SQRgOaYWQ9Wb
 z4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682052290; x=1684644290;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RhZuUb2HeJ5mB7PiyqC19ou7b7kxLTEcd/LF9lTLOtE=;
 b=HKnvrN11wMyg6dhNfGCXZDBQbitgNdh9S+cvIwQZ8TB+EUadzSFBaOm/mLcLt4tJ7u
 21yp5J2z0zIQDhqtHXE2CNqe689gvd18V28HQstAx3O8LTfZz8LAFJL5b7OvRtw1OFwO
 l/oAub4CtguFXT5F1+Lfp9FQnKdG+hEhPLq8xqryFLzwBzZWiaV9ayZlUTD6xt488SsO
 lhWDlaLcB1Ska30swCrrjlYVz6kHkFdk4v6e1zpe4na4cMBpNXo2x5NCVkmNlNsPYbyv
 6yBuNpUU+0GrUlonZM27WBUo2OIMz6DFo7uWwqnobi1qsdYGhHS0LwDa7E1tNm+2X3eP
 Xl/g==
X-Gm-Message-State: AAQBX9dm5Hpte0LT+w0vhWMxSP45nPgegDRTj1HhH9MhWyrjpmRpsaNI
 TK/3/tga69m7Aux336fE003TGw==
X-Google-Smtp-Source: AKy350Zcy38PU2mvpfQ6hq4xShJL6CIfZ9qLBVk44cXPY1SqTbpQlJbe1OZAPg810JMJ0mOU6tO/1Q==
X-Received: by 2002:a05:6830:43:b0:6a0:d291:90b0 with SMTP id
 d3-20020a056830004300b006a0d29190b0mr2184697otp.13.1682052290269; 
 Thu, 20 Apr 2023 21:44:50 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50]) by smtp.gmail.com with ESMTPSA id
 t18-20020a9d7f92000000b006a5eb4e5a42sm1425075otp.60.2023.04.20.21.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 21:44:49 -0700 (PDT)
Date: Fri, 21 Apr 2023 10:14:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
Message-ID: <ZEIUueMjCCQbNbCW@sunil-laptop>
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
 <CAEUhbmVFgpKXESX7RtqX5Z4mU0mdbYSU+=KD1R0qPhQt-wgfYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmVFgpKXESX7RtqX5Z4mU0mdbYSU+=KD1R0qPhQt-wgfYw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 04:44:53 -0000

On Fri, Apr 21, 2023 at 12:39:46PM +0800, Bin Meng wrote:
> On Fri, Apr 21, 2023 at 12:34 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
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
> > qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -pflash <smode_fw_code> \
> > -pflash <smode_vars> \
> > -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
> > -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
> > -machine virt
> 
> Please update the docs in docs/system/riscv/virt.rst to include how to
> run EDK2 bios with these settings.
> 
Thanks Bin. Shall I do it as a separate patch after this gets approved?
The reason is, I need to make changes in EDK2 to work with this. Once
EDK2 changes are also in place, will send a patch to update this
documentation. Does it make sense?

Thanks,
Sunil

