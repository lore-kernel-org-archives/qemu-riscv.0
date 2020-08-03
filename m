Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k2Ygj-0000Gu-7c
	for mharc-qemu-riscv@gnu.org; Mon, 03 Aug 2020 07:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k2Ygh-0000Fe-8M
 for qemu-riscv@nongnu.org; Mon, 03 Aug 2020 07:31:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k2Yge-0006bY-Cp
 for qemu-riscv@nongnu.org; Mon, 03 Aug 2020 07:31:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l2so23315440wrc.7
 for <qemu-riscv@nongnu.org>; Mon, 03 Aug 2020 04:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=+zdISvL0meyBz552Fbf+BUu1qz/BTBm425Mipq59Dqo=;
 b=Wk/3fq0H1HYVdwW/K64P50YGP94ELJ1w1st4fVgUhVjq0NvrPl9nJxRcZs41DVlFFS
 kTcg3du23k0te5kFlY0igWcHps8AWOl/n15kGzDzMf0yoOrUUHTCghDAx9lJAB69nHD0
 oIdrut1yN+lRMffrCviqsdNZU1xafijb4CDFt8f5oHXARgPHiqtR0uq4c20e3SSprU63
 I6C2GPwfPpL7bMzpu6Czzr8n63egRZgstzpzvLDsQAKRoXVb1VSM4YO6VjwarLtWlNlW
 Wx75/iN9bb6W4PB85wKwSLYfNVhv/2qBT/07qoa4SnaS/nMIp9qqaIxOy+LfdQ5Qh2/7
 xYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=+zdISvL0meyBz552Fbf+BUu1qz/BTBm425Mipq59Dqo=;
 b=uL5Cuv6vo/LH9KQEN4ebu8xDfZbnNtsepvX5/OGVdGfI3xnyKukorhWDLlmB2HCmLu
 B5AB5EL2QtRMh/l2GK6tX5HVJn/J9qiJS87HQd3VxVwVF3mSII+dDg5U2i/S9Az4z802
 aTwknmi0knrpsjR0CWZ9NRmOV2sDcTf1RzFerA/Yns+b0LiQZ4VXeQVnZMMceg92XGjA
 RKy1doE0vbZGtn1WrFf+Hrh7nl9Vo8otZGCYbd22OwyDN6K/dgc05Nk6giY1ZuK2TIqz
 O/iII/uiD+GmTPiVsO4FXM5LxvpEbiFIS5f/91fOe+Av0at+ao86Mj3EW4PMuiuTZu7U
 kbkg==
X-Gm-Message-State: AOAM533qqimKdZG+a+axZxDX0SmGw4/2KzmAoKLnQ3yihKEkewbgKLHE
 JXcfzbGl9pNCH7HMUjj1q1Wyig==
X-Google-Smtp-Source: ABdhPJzcAJvgswsU/okCnC0IzfNCX/bGddaUyCBvnQMB8yE4+d/jXjxVoOuqghkREvZsCJdaWMkwVA==
X-Received: by 2002:adf:e7c9:: with SMTP id e9mr15124451wrn.10.1596454282367; 
 Mon, 03 Aug 2020 04:31:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x4sm28314220wru.81.2020.08.03.04.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:31:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CF7A1FF7E;
 Mon,  3 Aug 2020 12:31:20 +0100 (BST)
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-76-frank.chang@sifive.com>
 <684f11b4-eb62-601a-1664-afaeca4b1711@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Hsiangkai Wang <kai.wang@sifive.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Laurent Vivier
 <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 75/76] target/riscv: gdb: support vector registers for
 rv64
In-reply-to: <684f11b4-eb62-601a-1664-afaeca4b1711@linaro.org>
Date: Mon, 03 Aug 2020 12:31:20 +0100
Message-ID: <878sewneyf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 03 Aug 2020 11:31:27 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
>> +    if (env->misa & RVV) {
>> +        /* TODO: support vlen other than 128, 256, 512 bits. */
>> +        const char *vector_xml_name =3D NULL;
>> +        switch (cpu->cfg.vlen) {
>> +        case 128:
>> +            vector_xml_name =3D "riscv-64bit-vector-128b.xml";
>> +            break;
>> +        case 256:
>> +            vector_xml_name =3D "riscv-64bit-vector-256b.xml";
>> +            break;
>> +        case 512:
>> +            vector_xml_name =3D "riscv-64bit-vector-512b.xml";
>> +            break;
>> +        default:
>> +            vector_xml_name =3D NULL;
>> +            break;
>> +        }
>
> I guess this is ok as-is, but consider mirroring
> arm_gen_dynamic_svereg_xml().

Longer term I would personally prefer us centralising the dynamic
building of XML to a gdbstub utility function. The eventual long term aim
would be for guests to register(!) their set of additional registers
with the central core code in a more useful form so we can also expose
them to the plugins system which will most likely not want to inflict
XML on the plugins ;-)


--=20
Alex Benn=C3=A9e

