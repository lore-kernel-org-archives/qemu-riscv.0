Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nObNw-0008L0-11
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 03:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nObNr-0008Ha-FP; Mon, 28 Feb 2022 03:27:55 -0500
Received: from [2607:f8b0:4864:20::12a] (port=45646
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nObNp-0001Zv-MM; Mon, 28 Feb 2022 03:27:55 -0500
Received: by mail-il1-x12a.google.com with SMTP id x14so4276514ill.12;
 Mon, 28 Feb 2022 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cAIxYvnV6osTfOFYhB385fapGTbc3BLSgWF8ELo1vU4=;
 b=QLDtmxThOrxefFnkvDMFG4gNC+mEb+Y3a1uzrqp9Teo1ir3MLMkuAvm8iLAuy4ZJLC
 ZXv5gQFRFE2z0AHgUXdheYLZI5cZihfUCitCL8uaymBb7PrIR5NsaGfh1bkTaPgHkJBt
 mrcQPwmdXGiII8D7kNJVhNHDDF205gSWUHhzyyfcQ7BEo4wbLPvbW3/JezZ5pUiNLjhH
 M2ijYYYN8viKoH2mLpNX5E8uZt3WtfmYJ+ECQ5LdxCOfmCQTb1ZDQ521aJ3oCqzAMPtc
 lOHESkXv5/mD1m1CPrp0X0NGURpENmOMvPS78S6VOe/tN4hg4/N/d0LfsKD2lfu3VA6p
 NfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cAIxYvnV6osTfOFYhB385fapGTbc3BLSgWF8ELo1vU4=;
 b=b2WTuSuQX8T88Ws7H5jhg8bwBAyXpT75eltID0DZ7EG2n6OUjTjVelVbEmfhdGdqZ2
 /QOX7u9vloj+VSJ3HJCCt/ov5GhKgZ90Q71eg3NkGRnGOmb9laJTK5LFnqnzvwbnSNua
 htF9gMwNlntefgcZ7nEzLNxBrsYQ/eZ/D5602DltQyKj3qJC/2nSFU1Qf6LACxMcLd5Y
 IORDaHgigHGDg93pAhq2C3uX9CEsnifPkFgqHT6Xs7l/qRNn3iLvTXUG+RvOAeVkIvLV
 gx/BeFTju3XezCeE+f9k8OQWWUJ6jBsXKrrKHcklPhtijgwjyLlshNeW730hExEaFL+R
 8Qwg==
X-Gm-Message-State: AOAM533gvNHf1O4GNufpcOyZigFMYAE+Jg6To594klTwQ2PzYuQyY4vL
 ZkrEuaN0a3b0haBcX4Z36R05xm/bPJi9OvTTVyc=
X-Google-Smtp-Source: ABdhPJwPRkLcGB/XI/Gtsof/ySHkH+k8Bt3r6TEG36yJnhkRlaaxMIzogK8hE0fbyco5+r2kTxotRWcmwdQemrI/V9c=
X-Received: by 2002:a92:d80c:0:b0:2c2:c40c:7bd4 with SMTP id
 y12-20020a92d80c000000b002c2c40c7bd4mr9471759ilm.310.1646036872303; Mon, 28
 Feb 2022 00:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20220211043920.28981-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220211043920.28981-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Feb 2022 18:27:25 +1000
Message-ID: <CAKmqyKOAwdwcCMqAYZ+EjZmLaHg8mVOxf+_MYxx05rVLSzBUjA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] support subsets of Float-Point in Integer
 Registers extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 08:27:56 -0000

On Fri, Feb 11, 2022 at 2:49 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension.
>
> Specification:
> https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0.pdf
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream-v6
>
> To test this implementation, specify cpu argument with 'zfinx =true,zdinx=true,zhinx=true,zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin=false'
> This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/.
>
> v6:
> * rename flags Z*inx to z*inx
> * rebase on apply-to-riscv.next
>
> v5:
> * put definition of ftemp and nftemp together, add comments for them
> * sperate the declare of variable i from loop
>
> v4:
> * combine register pair check for rv32 zdinx
> * clear mstatus.FS when RVF is disabled by write_misa
>
> v3:
> * delete unused reset for mstatus.FS
> * use positive test for RVF instead of negative test for ZFINX
> * replace get_ol with get_xl
> * use tcg_gen_concat_tl_i64 to unify tcg_gen_concat_i32_i64 and tcg_gen_deposit_i64
>
> v2:
> * hardwire mstatus.FS to zero when enable zfinx
> * do register-pair check at the begin of translation
> * optimize partial implemention as suggested
>
> Weiwei Li (6):
>   target/riscv: add cfg properties for zfinx, zdinx and zhinx{min}
>   target/riscv: hardwire mstatus.FS to zero when enable zfinx
>   target/riscv: add support for zfinx
>   target/riscv: add support for zdinx
>   target/riscv: add support for zhinx/zhinxmin
>   target/riscv: expose zfinx, zdinx, zhinx{min} properties

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                        |  17 ++
>  target/riscv/cpu.h                        |   4 +
>  target/riscv/cpu_helper.c                 |   6 +-
>  target/riscv/csr.c                        |  25 +-
>  target/riscv/fpu_helper.c                 | 178 ++++++------
>  target/riscv/helper.h                     |   4 +-
>  target/riscv/insn_trans/trans_rvd.c.inc   | 285 ++++++++++++++-----
>  target/riscv/insn_trans/trans_rvf.c.inc   | 314 +++++++++++++-------
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
>  target/riscv/internals.h                  |  32 ++-
>  target/riscv/translate.c                  | 149 +++++++++-
>  11 files changed, 974 insertions(+), 372 deletions(-)
>
> --
> 2.17.1
>
>

