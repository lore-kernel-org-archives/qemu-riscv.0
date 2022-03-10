Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSBwX-0004ah-Cj
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 01:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laokz@foxmail.com>)
 id 1nSBwT-0004Yq-BW; Thu, 10 Mar 2022 01:06:30 -0500
Received: from out203-205-251-73.mail.qq.com ([203.205.251.73]:58540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laokz@foxmail.com>)
 id 1nSBwK-00076h-E5; Thu, 10 Mar 2022 01:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646892363;
 bh=XO778j3A3PKa4Q1BRPGnDrn26wdLV+CIo4sQaq7sBqs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=xIPxtxRQ8nVpab9PVmMLprQqyqFkSqtXvzf7sd+16MG2wIlrNNKOZq48foyEiqM4U
 sMi/52I8fU0KpWgt1vmH/otEvqifhmd6Gbi3K14zhLunA5b4HIoUI7lp5Itrg573cy
 roE7V3+8TQvaley0DvuGGfi3ggwj1ljbnrqithNI=
Received: from [192.168.216.110] ([113.233.142.128])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 18114013; Thu, 10 Mar 2022 14:06:01 +0800
X-QQ-mid: xmsmtpt1646892361toic1vwbk
Message-ID: <tencent_B16ADC06BC0803AF52D436BDFCED7A9AA607@qq.com>
X-QQ-XMAILINFO: NiDupExshEc7KQIFGowtUVGmMBncPCFpgp0vPr6yqITNszus0OV5su5US5ICcp
 yhFsY8KOTJB2fB2mgWhIEIr4UYT2nuSMa4G4nk+1QG3nRfL0rG8SFTUmzkNWitUvdQrdVYI5G52g
 j6hJamTlDbtHO9t01BbSDTp8HRsGWbA6HBKqJaAYINkOYxGrN+j3kDnIJ3T92w9PPiPKnTdiJmQS
 ZDyFm4t9xzscGf4SDqzBUH5fQCAkOj1iJjvS6FAczRqbR1wHDZ9quUSLcmEQ1RthOQyZnKEWYMSg
 ss/6JeZB+OVTWei4PepBT/LO7icJA7IYE+m7WE24NMnra+Po6dBzzthEx1ydaGLYLwfeJmxKGGAr
 eV0N1nm+JBh04m0KB/sQNWHbhNloWGT09QxA9gbxwB6KDQOTbFotnsEzEF1TkWjAIOzSQspF//kD
 qrB4if/qgq/G5QU9t6Y9m97aeme7XrnfjVLSjlcX5YFO6y9ATqfKLdbRlWri9FsdagaXXEzTmnXT
 YMAU65HQVwnsWzY0IC5OrZvPIfhVulPaFJQrms1qbCg7n0cLzgPjr7RVbHDXjFrkM061Qb0kjL2D
 GtBp1hlqDwOry+fbe7UwrybyPSd9iEzwFJnJGCzO3Bm9ZZFVh9xRkdPnnxIbdCVjTmATDztx6bkT
 c4qnWXJwfCzxeASo/6f399UrTyg5ZZNixWjvDlt36lCsdGX3MdO4hamReAGNsDyupGO0zU6KWhyV
 AJo5GCRiWbgfWjh0hA45ule0QhE+sLVNVBg0HQHP91f9oDlbspraSyMUzBb3CnaxBW1FsuBBWLIO
 qvgrd0x+tgqm+Tvj1K6Rr8r3q9zEW4zo0TnqvEuDOcAB6sgZ3mF9iji+JaPchInp9KctlM40yp6w
 ==
X-OQ-MSGID: <4fadcc303b765e88023c1ec27e0d2ff2e713b48a.camel@foxmail.com>
Subject: Re: [PATCH v2] tests: add (riscv virt) machine mapping to testenv
From: laokz <laokz@foxmail.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
Cc: kwolf@redhat.com
Date: Thu, 10 Mar 2022 14:05:59 +0800
In-Reply-To: <5ff007ca-863a-81f9-4f99-3a1edc4106e0@redhat.com>
References: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
 <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
 <5ff007ca-863a-81f9-4f99-3a1edc4106e0@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.43.2-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.205.251.73; envelope-from=laokz@foxmail.com;
 helo=out203-205-251-73.mail.qq.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982,
 SCC_BODY_URI_ONLY=0.833, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 10 Mar 2022 06:06:30 -0000

On Wed, Mar 09, 2022 at 15:56 +0100=EF=BC=8CHanna Reitz wrote=EF=BC=9A
> On 08.03.22 05:33, laokz wrote:
> > Some qemu-iotests(040 etc) use PCI disk to do test. Without the
> > mapping, RISC-V flavor use spike as default machine which has no
> > PCI bus, causing test failure.
> >=20
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894
> >=20
> > Signed-off-by: Kai Zhang <laokz@foxmail.com>
> > ---
> > Thanks for the detailed info. Corrected S-o-b tag.
> >=20
> > =C2=A0 tests/qemu-iotests/testenv.py | 2 ++
> > =C2=A0 1 file changed, 2 insertions(+)
>=20
> Thanks!
>=20
> I=E2=80=99ve applied this patch to my block branch:
>=20
> https://gitlab.com/hreitz/qemu/-/commits/block
>=20
Got it. Thanks for your help!

