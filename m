Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJEvo-00060l-WA
	for mharc-qemu-riscv@gnu.org; Tue, 31 Mar 2020 07:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jJEvm-0005zi-8t
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 07:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1jJEvl-0001u4-7f
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 07:19:42 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1jJEvk-0001t2-SG
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 07:19:41 -0400
Received: by mail-wm1-x341.google.com with SMTP id b12so2007089wmj.3
 for <qemu-riscv@nongnu.org>; Tue, 31 Mar 2020 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=geJZCMvrUNcmYjo3qSm1Tn8ThMRGTj/0Gmcabw0Xnqs=;
 b=mVjXa9CS8W+RoZ5UPUCK/Loxk2ZfUaL3YIPeETI00lxRU1iSSiTYxQeWxRkceN6j9c
 gxySPCZNIdAKaHyAkZmY9OD1MI2GUDVsHQ6P0q1O4DnxdV68c/7LZrnajmycZGjgEYnT
 0PSANlg1RyWsxI9dZH0/5jnGqQno58sITAmO+EI38HkLNHmFwCG3bH7CZAGA8ZeSg1y7
 0gTTLV6LLKSM45FwJtehjAb3Yz4yaWJxQMvZKiRKOE/SPI9mbcdGmCnUakpGkismdU/X
 VIjoIFIKxKKpLnePAC0vQ0ReJol0/BEpKtxWFQS+Lq/s6XpVe4feg9oPdl4IPWtiBdV9
 7lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=geJZCMvrUNcmYjo3qSm1Tn8ThMRGTj/0Gmcabw0Xnqs=;
 b=bri17i558Xz5rhvEywJKiQAlZEqB7Yxsa2vGhpb4RNO2IgHdaOo4VPPgm/rsaCalrI
 PdGWHLb61T4RZJeJzpqUkUVncjxrZBpOBTtj5us6Wa1/SE48NisA5qlzehorgQg35rtc
 aIutFJT8hGSoDcZs3Qb3JuX1surlNGYXeSsnVuCyWRUal+zzYACjT4jTWC7sdNFklPty
 X4GMjcOFMBI/o7TPrbSkeRxzxl+405NozyukSPFILQxTbOwxs15hpe5XZ+R6wJ++pLEM
 JB7M+m25BMk6Hw1R14jfyVxXgxTj5dn4RsrzuOURJUuqOsGXDCJ4oyAwJlZvenTBkjua
 GDUw==
X-Gm-Message-State: ANhLgQ0QKKc5ppWfXnxlvzAe3iBeOFqCpJ9Npwl/d8Ph5VFXKJne+3oM
 EDWX7htoHScFp+nBuF0FFvOEI2Pblm4bK7T3AV8J1Q==
X-Google-Smtp-Source: ADFU+vvhzkkJ/9mMg6ecvYk/ZXrRPd048tDsdEcVFwA40WMS9SBPPsUlgchAg12fprxUbITGVRUQduGfcXq1dnx8ITU=
X-Received: by 2002:a1c:6146:: with SMTP id v67mr3100199wmb.78.1585653579430; 
 Tue, 31 Mar 2020 04:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200313034949.3028-1-jiangyifei@huawei.com>
 <20200313034949.3028-3-jiangyifei@huawei.com>
 <CAAhSdy3_BO7pRwvLiS9qd3NLXUCj_MnsxT8JtD0833AnY1DOZQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3_BO7pRwvLiS9qd3NLXUCj_MnsxT8JtD0833AnY1DOZQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 31 Mar 2020 16:49:27 +0530
Message-ID: <CAAhSdy24zBmuJ=BZFMXsHRJr-tLTEZs=C92QsE26KLGxPxd88Q@mail.gmail.com>
Subject: Re: [PATCH RFC 2/9] target/riscv: Add target/riscv/kvm.c to place the
 public kvm interface
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup.patel@wdc.com>, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Tue, 31 Mar 2020 11:19:43 -0000

On Tue, Mar 31, 2020 at 2:43 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Mar 13, 2020 at 9:23 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > Add target/riscv/kvm.c to place kvm_arch_* function needed by kvm/kvm-all.c.
> > Meanwhile, add riscv64 kvm support to configure.
>
> This should be for both riscv64 and riscv32. The KVMTOOL compiles perfectly
> fine for riscv32 (although not tested much) so there is no harm is supporting
> both riscv64 and riscv32 from start itself.

For your reference, I have updated KVM RISC-V and KVMTOOL RISC-V repos
at:
https://github.com/kvm-riscv/linux.git (riscv_kvm_master branch)
https://github.com/kvm-riscv/kvmtool.git (riscv_master branch)

Above repos work for both RV32 and RV64 systems.

Regards,
Anup

