Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXWqy-0005CI-2v
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 19:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXWqj-00059O-Sn; Wed, 01 Mar 2023 19:31:12 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXWqg-0002DK-EY; Wed, 01 Mar 2023 19:31:09 -0500
Received: by mail-ed1-x52c.google.com with SMTP id f13so61164251edz.6;
 Wed, 01 Mar 2023 16:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LrxL0tO/SNw0RRnDZqSp01uLw0Sasd9Wah6TAh5mKHw=;
 b=GVNEuArG3Pyy+nGRpFQj4rgDr1+ioZs2RoMTeitldlEwHHWzuvOByNZFFn5gZkSr3C
 nyrsNO4ZhnnSeO2yqMft5Yuqf3MFyca1+Kg/bhmGteeyzPzI071soic9DKPcZcNUavRE
 2sPqrvUHsEegkXhs5x2LEaDT261Ho5cBiAJxPYrbntCZeX5NcoqOO+4q6+E2YgGDBhjy
 mEMrD5zYvh0yB2+KDJ7p1CVimjx81TnBnBW/bFL0uiVQ595Qa4lqrFghYSE/vZS3jmRu
 pPstl+0xpiDWgvLQMgOIG1z82JBGsm+KEtYSOZWoorvik/RnNJ84thOEamo8C+KPPOu+
 qloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LrxL0tO/SNw0RRnDZqSp01uLw0Sasd9Wah6TAh5mKHw=;
 b=Q8rqxs7rV7MBa1F0a9cpeQtNbINfXmtMtA5yqfVmriwnwIe6eTef5rTx0l131eYIj5
 3Ux0PmA+RecpqSdIpSl7YMjJL4Eb+1hUDbSVf1CM2MullOD4BAhcXHu/hrozMLZDxt/s
 A51hoOWDpyPeL6dtV1095DTHpkZ8I2VpGh4e73x6vhWjRyf1b9ml2MVNDnO5neRU1P/1
 Mzku82glO9oDNotEm132i7GbOVyQ6UgK+w1P13vZOWSFLWRhCZ6jiPDvspYfW/H3fJun
 jwNp+IIBG014y5oNF9sOeMQvU70V3tWg2+cN5Nj8ihSF5DN6PA8KaEto1DW2iYa38zpi
 8E+A==
X-Gm-Message-State: AO0yUKXDKiPWt7vPMnxzttxdd91klI89yDt5E3HckL4774FGj/lmRenn
 poVSBAmXHsRr2ssiCQ6t8X5WeaVFvkHxzvdtI2Y=
X-Google-Smtp-Source: AK7set9IcA6HFLhTT08KRWgsp0Ms9yQi61r4IZc/yr7L07S2uj4q04V2QQgABptFHUV2GM4fB99x3XQKRFG5PQVFN/o=
X-Received: by 2002:a50:bb46:0:b0:4bc:eec5:37f5 with SMTP id
 y64-20020a50bb46000000b004bceec537f5mr1823305ede.6.1677717064015; Wed, 01 Mar
 2023 16:31:04 -0800 (PST)
MIME-Version: 1.0
References: <CAEUhbmWtg8+V44h7xgtggcORLww7kCv60DX+r3XYFTOrgzMtmA@mail.gmail.com>
 <mhng-4de827d1-bce4-4e30-b5d3-cd9e61e4b4db@palmer-ri-x1c9a>
In-Reply-To: <mhng-4de827d1-bce4-4e30-b5d3-cd9e61e4b4db@palmer-ri-x1c9a>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Mar 2023 08:30:52 +0800
Message-ID: <CAEUhbmVGe3mtG+NXkLJ9yKcQEXUB8dsZiFDW=d1kmRzWR-Mrdg@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML
 if Zicsr is disabled
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: zhiwei_liu@linux.alibaba.com, bmeng@tinylab.org, qemu-devel@nongnu.org, 
 liweiwei@iscas.ac.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 00:31:15 -0000

On Thu, Mar 2, 2023 at 7:43=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
>
> On Wed, 01 Mar 2023 01:55:34 PST (-0800), Bin Meng wrote:
> > On Wed, Mar 1, 2023 at 5:52=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.ali=
baba.com> wrote:
> >>
> >>
> >> On 2023/2/28 18:40, Bin Meng wrote:
> >> > There is no need to generate the CSR XML if the Zicsr extension
> >> > is not enabled.
> >>
> >> Should we generate the FPU XML or Vector XML when Zicsr is not enabled=
?
> >
> > Good point. I think we should disable that too.
>
> Seems reasonable.  Did you want to do that as part of a v3, or just as a
> follow-on fix?
>

I looked at this further.

The FPU / Vector XML is guarded by the " env->misa_ext" check. If
Zicsr is disabled while F or V extension is off, QEMU will error out
in riscv_cpu_realize() earlier before the gdbstub init.

So current patch should be fine.

Regards,
Bin

