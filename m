Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY3xp-0002cm-4J
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 06:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY3xo-0002cd-7J
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 06:52:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY3xm-0006DJ-0o
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 06:52:39 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bx12so1961085wrb.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677844355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnOmpX6F8ikRDUfp7P1Jbr8PUAjqMRlXr1Vehl3RTTI=;
 b=XUgJQlJg27CK5+HSn06mdsEbzPX8zjwvNwsCufzTxQRKlbZ3FrXW6Hys58wL5s5KZL
 6pzHhu+TMfbce7Jonv3IdLtaHVvHc+c7n4/7KWy6FTFRFajZWH2mn05JIhbDm/ctw7+/
 fJ18u1hvHVEwZxUFozPZn74A2ZCdOSwvGXbIpGasjSEhEe72wb34/SB4o4/6/43CZLow
 iuikCSgpb32yDlBAG8Yn3s7QF+V+xaXWRueIvt/Ld/5rlP7aC3zdlA91ZsFOLb4IV5cg
 nF/Eg+XRN5d7dqfINfCvDtD5+JpRQEh+GAaEC3JxAlEAX7Pqkq5dMh9B04CtdCe9vVhO
 joXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677844355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnOmpX6F8ikRDUfp7P1Jbr8PUAjqMRlXr1Vehl3RTTI=;
 b=wT20tni2xbUpxRZ4QOCCJ322pCtoUfevmb5nmOZnmANtNSedgFVpngv1ArCMPFWGkm
 OY4eguQio9N1N85gkcsiQK3HyaNQpThjrGZm9QlaRhkyWjH9J7ceRDAJueAjPxxhyBrt
 4qSOkX4/69nQAxDu8nth2GaY55qW3ktOzrY0omYhztHaaizzBqIZKt+G6uJh2QpR6vNf
 SpdoP8IpPM7IZSrnoMS+Ec7b81ArLaWvRHiQ/C50ybe35GMiW4i/mY8v/02MiSJssAUW
 mncVAYmqyUjOtDRLUGiViZMSskcn2juOm/IP7Q/68JuBvchtPi9nc5islEPyvSzO9Msr
 3mDQ==
X-Gm-Message-State: AO0yUKWkWkrg1683MGLUdCuOoS2SFTtdDuY7gb0iucdtwWoDjpLdfQMG
 dEg1iA7lYQDmH2AvwWL+Y9qRT6rhEUxvjxrUGVgKSQ==
X-Google-Smtp-Source: AK7set8C12nMDX+l8t4T17RGIpkYZfTSLyPqt40rvmLjpdDpWZ+jVA7R3SiYbVXjMOYyoLsvgCXKgUrc6XqpKpqDZbM=
X-Received: by 2002:adf:f90e:0:b0:2cd:ebb0:3895 with SMTP id
 b14-20020adff90e000000b002cdebb03895mr309025wrr.5.1677844355513; Fri, 03 Mar
 2023 03:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
 <7591407b-e8d0-aa05-86a3-8ca7988a6e69@ventanamicro.com>
 <66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com>
In-Reply-To: <66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 3 Mar 2023 12:52:24 +0100
Message-ID: <CAHVXubhHbkK12EfGjs7owS9_9rv4DS1bpxQEfWKzdpCg=EHwGA@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] riscv: Allow user to set the satp mode
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 11:52:40 -0000

Hi Daniel,

On Thu, Mar 2, 2023 at 10:03=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 3/2/23 14:42, Daniel Henrique Barboza wrote:
> > Hi Palmer,
> >
> > I think this series can be picked. All patches are fully acked. There i=
s a nit
> > in patch 3 that I believe you can choose to fix in-tree if you want to.
>
> Update: patch 1 is not applicable anymore due to changes in current maste=
r. All
> other patches have conflicts as well.
>
> I guess it's easier to Alexandre to rebase and re-send it when possible. =
Frank's
> comment in patch 3 can also be handled during the process.

Sure I'll do that today,

Thanks,

Alex

>
>
> Thanks,
>
>
> Daniel
>
>
>
> >
> >
> > Thanks,
> >
> >
> > Daniel
> >
> >
> >
> >
> > On 2/3/23 02:58, Alexandre Ghiti wrote:
> >> This introduces new properties to allow the user to set the satp mode,
> >> see patch 3 for full syntax. In addition, it prevents cpus to boot in =
a
> >> satp mode they do not support (see patch 4).
> >>
> >> base-commit: commit 75cc28648574 ("configure: remove
> >> backwards-compatibility code"
> >>
> >> v10:
> >> - Fix user mode build by surrounding satp handling with #ifndef
> >>    CONFIG_USER_ONLY, Frank
> >> - Fix AB/RB from Frank and Alistair
> >>
> >> v9:
> >> - Move valid_vm[i] up, Andrew
> >> - Fixed expansion of the bitmap map, Bin
> >> - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
> >> - Remove outer parenthesis and alignment, Bin
> >> - Fix qemu32 build failure, Bin
> >> - Fixed a few typos, Bin
> >> - Add RB from Andrew and Bin
> >>
> >> v8:
> >> - Remove useless !map check, Andrew
> >> - Add RB from Andrew
> >>
> >> v7:
> >> - Expand map to contain all valid modes, Andrew
> >> - Fix commit log for patch 3, Andrew
> >> - Remove is_32_bit argument from set_satp_mode_default, Andrew
> >> - Move and fixed comment, Andrew
> >> - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
> >>    too early, Alex
> >> - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
> >> - Use satp_mode directly instead of a string in
> >>    set_satp_mode_max_supported, Andrew
> >> - Swap the patch introducing supported bitmap and the patch that sets
> >>    sv57 in the dt, Andrew
> >> - Add various RB from Andrew and Alistair, thanks
> >>
> >> v6:
> >> - Remove the valid_vm check in validate_vm and add it to the finalize =
function
> >>    so that map already contains the constraint, Alex
> >> - Add forgotten mbare to satp_mode_from_str, Alex
> >> - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, =
Andrew
> >> - Only add satp mode properties corresponding to the cpu, and then rem=
ove the
> >>    check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
> >>    Andrew/Alistair/Alex
> >> - Move mmu-type setting to its own patch, Andrew
> >> - patch 5 is new and is a fix, Alex
> >>
> >> v5:
> >> - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
> >>    suggested by Andrew
> >> - Split the v4 patch into 2 patches as suggested by Andrew
> >> - Lot of other minor corrections, from Andrew
> >> - Set the satp mode N by disabling the satp mode N + 1
> >> - Add a helper to set satp mode from a string, as suggested by Frank
> >>
> >> v4:
> >> - Use custom boolean properties instead of OnOffAuto properties, based
> >>    on ARMVQMap, as suggested by Andrew
> >>
> >> v3:
> >> - Free sv_name as pointed by Bin
> >> - Replace satp-mode with boolean properties as suggested by Andrew
> >> - Removed RB from Atish as the patch considerably changed
> >>
> >> v2:
> >> - Use error_setg + return as suggested by Alistair
> >> - Add RB from Atish
> >> - Fixed checkpatch issues missed in v1
> >> - Replaced Ludovic email address with the rivos one
> >>
> >> Alexandre Ghiti (5):
> >>    riscv: Pass Object to register_cpu_props instead of DeviceState
> >>    riscv: Change type of valid_vm_1_10_[32|64] to bool
> >>    riscv: Allow user to set the satp mode
> >>    riscv: Introduce satp mode hw capabilities
> >>    riscv: Correctly set the device-tree entry 'mmu-type'
> >>
> >>   hw/riscv/virt.c    |  19 ++--
> >>   target/riscv/cpu.c | 271 +++++++++++++++++++++++++++++++++++++++++++=
--
> >>   target/riscv/cpu.h |  25 +++++
> >>   target/riscv/csr.c |  29 +++--
> >>   4 files changed, 313 insertions(+), 31 deletions(-)
> >>

