Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kayro-0005fn-6B
	for mharc-qemu-riscv@gnu.org; Fri, 06 Nov 2020 05:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kayrm-0005fS-I4
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2020 05:21:10 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:32937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kayrh-0006TV-E3
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2020 05:21:10 -0500
Received: by mail-wr1-x443.google.com with SMTP id b8so752676wrn.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2020 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=gkXQFk8ElP3mY5vL8CWxpeOrMjtUAz9W9g+C9WztUcY=;
 b=H/zpi1pZbfY+MH6JsPEyMHxrAtmypG3/TMi31iiD6zKUl5+CFSb2oNNacKvl9lKazQ
 Eni2r+WyYxImOSujcNgNCoIRRvYOYetUu4E77lEQryNFVggqDD8BhVxGeZ7Tb9kIe+2i
 QYOPF9M8NQ9CoKL5saneHI/iEwoldhO5kqvMSLKpTSaINH6XbzqdtM0SZg0X1C960bwz
 C1AMTum7Vptx6ktP/3MvySMQCbLdGjsfO1UmOLnn44fy1xxoNJRqMDEryEvVWC4RR1fA
 xcv50K5OWZ5cQbT6eRcMiDa3d6Ef0XkxBecg0br4005D+PyxlNGvArmRn8rdpaQSeugw
 64DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=gkXQFk8ElP3mY5vL8CWxpeOrMjtUAz9W9g+C9WztUcY=;
 b=U2ieDUOruH1gcBfTujUecmtj79NAkarMC46HVTGAHZZyOZGyFzbKn8kCrjC7w2dZIC
 bp/516GWjGwz8tugoCZbuU2ykTpv7XlOJi7uErlwvltWvRF/DzdlUYyR1stXd+sBDX4l
 U9UF1McQg2L08MtV8E8pEWK7Qqx4ECMdg8Ptjg5Uzn6cTIsuovolAa7c4vwaXs6fUtrF
 +BYxxjggG6mvjOWYOvJ6WPsf6ZEx3+WFgHO4fY2emADJCp80AjYCMBehdDATFt1hrx1X
 Js1c/BKfu9ydo4kKn1um4VwY6JUyAEshp/B3UwspVXbZfhv1tq557nGeXFJMpwBA44T0
 PCDg==
X-Gm-Message-State: AOAM5332k+sN4axKiexEA5Cty833hKkCEYoWiWpwJW4MbKB2jZR+RAYp
 0lY+5luHmD1Aba639nITCxqnHg==
X-Google-Smtp-Source: ABdhPJxgSTmYpdWOvsph0hgCq/i8mqqgRyzZ+fAurXnb87RxoSX0EJX+xw4MEuizGItm9NNGFLQoCg==
X-Received: by 2002:adf:f482:: with SMTP id l2mr1828457wro.26.1604658063160;
 Fri, 06 Nov 2020 02:21:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm1341346wre.91.2020.11.06.02.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 02:21:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47E7E1FF7E;
 Fri,  6 Nov 2020 10:21:01 +0000 (GMT)
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-3-alex.bennee@linaro.org>
 <CAEUhbmUkwq318FW=8cTuU1fcPk8U46EEUr5f6P9QJTdonNZHJA@mail.gmail.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 julien@xen.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 masami.hiramatsu@linaro.org, Andre Przywara <andre.przywara@arm.com>,
 stefano.stabellini@linaro.org, AKASHI Takahiro
 <takahiro.akashi@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, stefano.stabellini@xilinx.com, "open list:RISC-V TCG
 CPUs" <qemu-riscv@nongnu.org>, stratos-dev@op-lists.linaro.org
Subject: Re: [RFC PATCH 02/15] hw/riscv: migrate fdt field to generic
 MachineState
In-reply-to: <CAEUhbmUkwq318FW=8cTuU1fcPk8U46EEUr5f6P9QJTdonNZHJA@mail.gmail.com>
Date: Fri, 06 Nov 2020 10:21:01 +0000
Message-ID: <874km2bxbm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 06 Nov 2020 10:21:10 -0000


Bin Meng <bmeng.cn@gmail.com> writes:

> On Fri, Nov 6, 2020 at 1:57 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> This is a mechanical change to make the fdt available through
>> MachineState.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  include/hw/riscv/virt.h |  1 -
>>  hw/riscv/virt.c         | 20 ++++++++++----------
>>  2 files changed, 10 insertions(+), 11 deletions(-)
>
> What about the 'sifive_u' and 'spike' machines?

If they support direct -kernel loading then we could certainly do the
same for them.

>
> Regards,
> Bin


--=20
Alex Benn=C3=A9e

