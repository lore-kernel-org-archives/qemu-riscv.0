Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGJcL-0008AO-2W
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 07:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pGJcJ-0008AD-Ct
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 07:57:07 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pGJcH-000227-Az
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 07:57:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E77D861A69;
 Fri, 13 Jan 2023 12:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867CCC433D2;
 Fri, 13 Jan 2023 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673614623;
 bh=wCJ/S3iFoqSUJG0SoJig84YphylbsgMs7DTrMA8CTbY=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=aQPq123Xbu70FmbdC7YjooRaqp/EVph+d8yQZmS/7gxeLEEf3tIyyx6n17q9cPAU+
 M1ZXW7zdvdHj9fsy1EJ01IlQnm8a1gI+xKnwqU6ko41SLKISEba2dQECmJmkvhBQVX
 ihZTiFoh1EBclRknRPylcV8d8VLg9chju6rjHbVOeMm5iOoRRjTW/laL5MpWjZUXas
 jxMSRJyZK/5CjS7Y1zDUcPChhQdDBCttOWZ4RKBPr2AF86kH/6ruzD2nO6r+k9E88o
 cwSQmzrHpm8DicKoENQBPGksQZ3ARdDGVWkgXutJuY6gwCnLwjlcIOfEMxX7ViSJjs
 evAwBvomE3O/A==
Date: Fri, 13 Jan 2023 12:56:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bmeng.cn@gmail.com>
CC: stage TC <stagethalescristal@gmail.com>, qemu-riscv@nongnu.org
Subject: Re: qemu icicle kit es
User-Agent: K-9 Mail for Android
In-Reply-To: <CAEUhbmUa0kCssKBxmkt5qvH5oQmjrbDk_LBb4S2acfGLmzUh5g@mail.gmail.com>
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
 <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
 <Y8BLZLw6gP4hUpyy@spud>
 <CAEUhbmUa0kCssKBxmkt5qvH5oQmjrbDk_LBb4S2acfGLmzUh5g@mail.gmail.com>
Message-ID: <2882065D-831B-4E8C-BFD3-677BB8ECA2AD@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 13 Jan 2023 12:57:07 -0000



On 13 January 2023 00:35:11 GMT, Bin Meng <bmeng=2Ecn@gmail=2Ecom> wrote:
>On Fri, Jan 13, 2023 at 2:03 AM Conor Dooley <conor@kernel=2Eorg> wrote:
>>
>> +CC Bin Meng
>>

>> Bin Meng, you're listed as a supporter (in master anyway) but is that
>> still accurate? I figure there's a good chance it isn't anymore?
>> Have you tested the platform from HSS init at all lately?
>
>Yes, I am still maintaining the QEMU PolarFire SoC=2E The WiKi page
>listed the exact HSS version I tested and if it doesn't, it should be
>a regression in QEMU=2E If yes, I would like to have a look at that=2E

That'd be great=2E
I submitted a few patches for fixing the direct kernel boot & hopefully ha=
ven't broken anything!
I'll try to test it also, if I get some time=2E

>Running more recent HSS is known to break, because QEMU does not
>follow up quite closely with the HSS implementation as HSS has evolved
>quite quickly in the past=2E

Yeah, although the rate of change has slowed down now=2E
I think there's a decent but of emulation missing though to get a recent v=
ersion of the HSS working=2E

Thanks,
Conor=2E



