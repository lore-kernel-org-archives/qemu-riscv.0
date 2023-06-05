Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C6C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:24:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6B7h-0006Il-Fc; Mon, 05 Jun 2023 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1q6B7a-0006Hm-8a
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 10:23:47 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1q6B7T-00011K-Rm
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 10:23:44 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so6166222e87.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685975017; x=1688567017; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zw3iz6Edi9TAPeU2tlXpO5biCnMLhrpMI7RUjAIFv5M=;
 b=TzXMiMUddRTLlZmCY4vvpi6wwuxGNwfcDiH2qJSC4fpQP/azJTNp9USUo3ml6L0V1V
 IhQKOeyv5EGUg1dwVxj3ZH6N8za+XNl0oVGJkd/KEIZJ76VYH923GHsM9s2u+JPYvJJa
 QsWlfjX6ZPQixAaw0W0EX1juK8DgkAwJ6EJv6s7CzzTy6IcVIyCFnNKmDZLHV3vexnlL
 TeQDViivewhZc2idi775tMPeXQhwE2vS4LS9E/9kpmXZ4FL+TKDKZdoTZQXC1kX3SeNj
 ZJ2cr+HenE2V718StPKDVFCxKVXfYnJmv3Ds9NMshvrkI+P8mDITCdy2U6aMlrJqqGEA
 4IGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685975017; x=1688567017;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zw3iz6Edi9TAPeU2tlXpO5biCnMLhrpMI7RUjAIFv5M=;
 b=O6Gq2ThOMHhEVdO3btEu5Qu+n/bcXfTTv5Pimzf5kBGKVBJwmILQvlgQw2hW0oAeq0
 wO4Dn/ZcL7XV5KEpb6wNldonkHbHy+JAhMKwk6MWMwfAHuAMqg7zZiFgL0gyTn+lSorl
 PtXjUvaIighBuFZOHTmkD6/5Nu3B3dSyzmjUxwTqZaw9GoKedGKCWSYHCfSbeqcuIVw7
 k+K33+ePAbC+8nFNxR2kFbt99XhF47UTLLc7Lk9V++Jy3QY7XkDaInWi4rrEY7iHjQ7E
 5l4wHetBcePrf/45bBV+mJZE5M359BZhQjdc/y729puIDKPEZJOEQuHlLsNVqbqOGlV4
 uwqw==
X-Gm-Message-State: AC+VfDzrG7JczbRwxQNSWkFE9bGvNZarMFlvTWf88ostpkMjZQdBM7K7
 gjk+2yydlC602MjwRLL4OyJmKGOx1WpCsb456BqS3A==
X-Google-Smtp-Source: ACHHUZ6y3jW/CXLM+o54hvIrulJzc6iQhmU1DHCGU8GyLXK5AyBUXp8Xgt7W0AoEq8MlHxnOhjFSVw==
X-Received: by 2002:a19:ac0b:0:b0:4f3:a49b:121f with SMTP id
 g11-20020a19ac0b000000b004f3a49b121fmr5623207lfc.40.1685975016779; 
 Mon, 05 Jun 2023 07:23:36 -0700 (PDT)
Received: from [192.168.50.45] (h-155-4-92-80.A980.priv.bahnhof.se.
 [155.4.92.80]) by smtp.gmail.com with ESMTPSA id
 u11-20020ac248ab000000b004e90dee5469sm1145068lfg.157.2023.06.05.07.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 07:23:36 -0700 (PDT)
Message-ID: <b983c9568a8b2ab3834d6f25f9b920889a1a5662.camel@rivosinc.com>
Subject: Re: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
From: Robbin Ehn <rehn@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, qemu-riscv@nongnu.org
Date: Mon, 05 Jun 2023 16:23:34 +0200
In-Reply-To: <85f76944-5657-4680-4e24-fd69c37c3b67@linaro.org>
References: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
 <85f76944-5657-4680-4e24-fd69c37c3b67@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=rehn@rivosinc.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, 2023-06-02 at 19:57 -0700, Richard Henderson wrote:

>=20
> > +        case RISCV_HWPROBE_KEY_CPUPERF_0:
> > +            pair->value =3D RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>=20
> Is that really what you want to expose here?  FAST is always going to be =
true, in that=20
> handling the unaligned access in the host is going to be faster than in t=
he emulated guest.

The plan was to add this in the cpu cfg in a later patch.
This setting e.g. changes jitted code and therefore it's helpful if such ge=
nerated code
is the same in the emulated guest as it would be on that actual cpu.

I'll change to FAST as the hardcoded value until then.

>=20
>=20
> Where does CPU_ALLOC_SIZE and CPU_COUNT_S come from?
>=20
> > +                unlock_user(host_cpus, arg4, cpu_setsize);
> > +                /* no selected cpu */
> > +                if (ccpu =3D=3D 0) {
> > +                    return -TARGET_EINVAL;
> > +                }
>=20
> I suppose you're just looking to see that the set is not empty?

Yes, exactly.

Thanks again! I'll send out an update.

/Robbin


>=20
>=20
> r~


