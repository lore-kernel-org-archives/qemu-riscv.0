Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXJBi-0002Vg-Hu
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 04:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXJBh-0002Sy-AW; Wed, 01 Mar 2023 04:55:53 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXJBc-0003a2-1U; Wed, 01 Mar 2023 04:55:49 -0500
Received: by mail-ed1-x530.google.com with SMTP id cw28so2342089edb.5;
 Wed, 01 Mar 2023 01:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1MCv/PXQ1xNCYra+TZIM+TeVdzG3M2/dQOXoq76nok=;
 b=E3cV15zCAmhbA07HrJ1FjleVTjc+K2XeHX8BNL7R3GKEQxeeSkMPLeDLamzmKJEHNE
 EgNpwWNLyr10e1C/RGsflkNE+K9OFbAr2ZEeC905yysuNNCoLDTkCy/FxPhDHOwuwoo0
 9lqgQmIjM96aaulrYySQlq2uqh0djH23Xzow4OBdHPnvDKCSiaQEeR7fe865bE6jK656
 1bc9L9pkm/B6zt8es+GHFLN6cbJ+xEC4nfHiq2TvObNtKxAl3zPm65QmNzqkRcjGbMcn
 XuLTPq+CimvlKXGZfnRPlQAa7ig+A1fHIVfWdcMBeywjkAZwoy0+6DeJLYi21gPbGuRY
 Fk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1MCv/PXQ1xNCYra+TZIM+TeVdzG3M2/dQOXoq76nok=;
 b=xgQctwlcb8Vdz/kXZVRUXyPIIhZKfeJOA6vaioRnfzS+MT3y20oC1crwwQ5ac1ctrw
 4OipRB4TXJf9veY3xOYwhfsofh/Vv/294DAUdH1Re8K5SaWq/c/glcpRWuApYOvJEYR/
 ecSR20yCP3zWMbNwjytJ4roYD1pKwGnZeUP3NUkXn8yGLXwuwPMOS8hnMZX6pyU8yiyz
 gq6RLgirqrTgyQQib70O66VzF4sHQcsNjEj6nmD3RG/pe1SA+TACKiQrrbWITaF+Ud2o
 Yb2ycm6IgcO5dT9B7h2R9asvSjjpdSoDwz3Lx48dnH/EuKkSqU99AtLeYOkEVpZTErNo
 p++g==
X-Gm-Message-State: AO0yUKWFvhiSD1RwWZL7eZKropt921/ZAp+fGh53C7udTobS2CIIG48i
 YmVqhF/39ozNoa0VtJV8xKcDrYmvYCoEZZD6h+k=
X-Google-Smtp-Source: AK7set8FWG6fbzX57DNa52cCxFhgz0EhBuybLP5yyEYGqn2CmGNXWxU8np0yXu7/Ry4q8OlWuyodqNq4qjxwhK1NJKk=
X-Received: by 2002:a17:907:7648:b0:8b1:7e1b:5ec1 with SMTP id
 kj8-20020a170907764800b008b17e1b5ec1mr2966667ejc.6.1677664545939; Wed, 01 Mar
 2023 01:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20230228104035.1879882-1-bmeng@tinylab.org>
 <20230228104035.1879882-6-bmeng@tinylab.org>
 <bc58e75a-e791-a507-767d-c95dbc59bc38@linux.alibaba.com>
In-Reply-To: <bc58e75a-e791-a507-767d-c95dbc59bc38@linux.alibaba.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Mar 2023 17:55:34 +0800
Message-ID: <CAEUhbmWtg8+V44h7xgtggcORLww7kCv60DX+r3XYFTOrgzMtmA@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML
 if Zicsr is disabled
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Wed, 01 Mar 2023 09:55:53 -0000

On Wed, Mar 1, 2023 at 5:52=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
>
> On 2023/2/28 18:40, Bin Meng wrote:
> > There is no need to generate the CSR XML if the Zicsr extension
> > is not enabled.
>
> Should we generate the FPU XML or Vector XML when Zicsr is not enabled?

Good point. I think we should disable that too.

>
> Zhiwei
>

Regards,
Bin

