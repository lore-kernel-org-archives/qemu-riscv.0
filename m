Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E0606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 06:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6l8VyRC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdbZmH6n
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLE5A-0004nM-22; Mon, 26 Oct 2026 02:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLE57-0004mk-7Y
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 02:21:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLE55-00050D-Fj
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 02:21:16 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69Q4aVv91708697
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GNAVyZ6P17QNJ0BN2RK9Xr7zP1Ls34awkpI3WNmJTgI=; b=W6l8VyRCctIKTPG2
 ZX+OPk89Ql9woHZqnJgvNsFrPC/SkgZUY/afCsSuF+ZlYGTnTPet56IEkYjrK6IZ
 tZ6NXWko5FlfoWpRQFnlSiNJURZcgHRkNSaGimCieUii4EqkZ9O6SgHz3Z9QTS7F
 sN/WM/Qz3w/vuoq//yzqtRAjvI1wfeQmGYYRVuPFh4xBuoItuqA5i0ZQrCFWiEji
 Iu3gIcbKpy3zPmlz0vViyoDjot1GHItR2oC6ylYTSAoEQQ0hCYu7malYJFD1JLXJ
 ArFBtGs8/TuDWvMyTM5OjHmKZemhkRs9uoNhsiKki7PLKPMd74XlZF2xS6rswK50
 c2KXWg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd93sx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:21:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5c9e0f047a6so48610e0c.3
 for <qemu-riscv@nongnu.org>; Sun, 25 Oct 2026 23:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792995670; cv=none;
 d=google.com; s=arc-20260327;
 b=rnVezuxBTeKz10ocRWl2X8Xom5yh69xVw0xV4uPOselEg5ijheja6pRBBO4rUWhXkS
 tHa+DlKlNC6yD6n5Qq6FVGw+NC552+q8qxfdTnEi/8ds64CvhjeDSEOJjLRzaOEEzVpY
 zJVPdd+qqLLrXJtevBZBaT4ElK/C/A0ih1Hf48BnUa5CKqLa25wIleR5lG8BSi4I0nr2
 8tSpdCJChP2KNJlRfgHRhvIVJBJTJwzoHXVpRUvFhXi4W/Gg2ldvwLCCvmflfrxwuexr
 L+8ehjCf6XkY7/+VgcD++cBx7RUQAw+qokg+MSVLWd9sq+iBiI5dlVF5mVrB1em5bQy/
 ++bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GNAVyZ6P17QNJ0BN2RK9Xr7zP1Ls34awkpI3WNmJTgI=;
 fh=haGP2Jd3omzNfgtAb6UfGZo3xDbnqTDxZ3NOVqkak98=;
 b=MGMvTg1Y46/qvLw+kttB1TlVfIJgU4sOJoaWPY4Gjy9t3YRZ7i4ZbfQutiN/julsJc
 Vjn2mVkUcltnQSbT+pXWe3y+3UIIDBg1jT0GhStY+xtw04ce/2RHlp4sxz8HGeKY1BtR
 cXjuUPJMKbIzpwJ21kK//0LJgSy2NOfjbR5mQEA/sW3BorxUQEtkSk0X1eFxpfAl74q5
 +uSqiyUIvp+7QBwt7LFbxDDk0HiARFBiaCfDldU/riT5F2ZQn1L6+O23IEl90Zc6xPef
 kSyuN6l5iuZfUnRf5O8xLxXCOxu8sZfNteTlMmVXNMPSRXT137a5StOsbCM6gVFWKPOX
 smVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792995670; x=1793600470; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GNAVyZ6P17QNJ0BN2RK9Xr7zP1Ls34awkpI3WNmJTgI=;
 b=LdbZmH6neYpSkzwYRGlddq5K3fs6LNsbEUtnWML6RND3FvDlSY3UuyKSEdQIKj0i4h
 3sSNWXr23+1vfY7s43dStOGmUfUuLP8GDYweX+ok64WBl6A4gaD+TIByJ6/7l4f3LDXM
 mXJ4BDqsQDrOt4FGDLDnBqLpjqYvxQrw7Nci5hBPkM0HBN6K921IFx9klMtTJ8HeNYTJ
 HTr3tWEU+xH18rmUo/yyFYZ/f6/JbSsSY8ahUHqqMilsH7heIyWcG81b11+ptreQpnDz
 Ghp1KYj+PnNqk8Fuk1p9XAz4Z5wMTE6C7+vWMlSwcq67BHcjsFhJCbifcdj6Zg+ToA72
 G+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792995670; x=1793600470;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GNAVyZ6P17QNJ0BN2RK9Xr7zP1Ls34awkpI3WNmJTgI=;
 b=KBJXDa2EkDFv+lwRMM9GXFs5Pyloyh66J1cmDzLCpyt71/70fTgpTddMr7MVnmZNIS
 wWq+q6Z/w9rcWShZZKXbVuFx5KWCMvO+2yywIowSy9LfNN/it1zw+UTSLEadNCg8tW7T
 XGQ5aBmJy2PPc+qTMhT7YmwdEkGIQKAa/XOTh3f+GyeuwWTR0oicfLcgHQM26QiuNEn/
 0ao03D3dyvfIPbYvPhNvXURVcZfsxWIRQOD196CrkCHaUnVYpxfU+hGOn9tq4RzLqt7R
 rFdOkdtC8wQloAZiX0umd/jueP3Sw/VUHu3spjU97z6tCYZ3jbFqO9sunbSc2FM6H4d4
 2NHg==
X-Forwarded-Encrypted: i=1;
 AKwUvByPnrBoXmJB2fm+whE8XaZLL4G9v1tGBMPP1W3BbhKW6tYRZyVAQKtLKQ5nLWvvnq3k8aPVLTSNSziV@nongnu.org
X-Gm-Message-State: AFq9FYJdkMeYLL5d9ODs7dxDRBnIJLh0rc1tBm0sQy47XZm3YflA53/N
 EFT41qy2RFfSETdasUgBFg7B4EHcztGZ/mxLIECxcJsPgDCEykoAwmABw0CFHf1yb2W9SODwptd
 uTRFjteJb7eEvvwy51Ywj1+6ox9ozd4Ox55pKXJP1JtFZfnqqcjknS7my2R/fns996b6+mxxLvx
 MX0pZzYQ7nyNKKEPnJ9eBVwMTq25ay+tT2
X-Gm-Gg: AYBFou2F1dQ7hSZo9TKUeAHBpV5ptI9SN8x7LgUI3JxNJrUJHg1DSw3WeBeLlQi/wk6
 H4zhrgbCHksvZjdc/aVNqyJn0O8m8Phs0gxOpWaTAAVzN95tT7hdTqT33Jp+soRvciYxqPBFBSw
 nkpCNEe89mA2g4ibYVGx7FJ7q/XYOZhi3aeXOM0quMidkL0Q6BAItht/w9ZvE=
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id
 71dfb90a1353d-5ec230af32bmr1070718e0c.1.1792995669645; 
 Sun, 25 Oct 2026 23:21:09 -0700 (PDT)
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id
 71dfb90a1353d-5ec230af32bmr1070715e0c.1.1792995669220; Sun, 25 Oct 2026
 23:21:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260917052250.1041262-4-subrahmanya.lingappa@oss.qualcomm.com>
 <as50cyb5yWynlBVc@MON-LT-C78453.mchp-main.com>
In-Reply-To: <as50cyb5yWynlBVc@MON-LT-C78453.mchp-main.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:50:58 +0530
X-Gm-Features: AclHuK_RSvEZIwGavAaSY6Iu02RIGwfWMRC6mkrId8ncSwBEC_wsWyP_VXqxhmY
Message-ID: <CAPxK-6ePz9nL0m3jDmVYZYKr27Wbg=UWc7Ar03TuX9MFC4=RVQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/10] hw/riscv: add RPMI FDT helpers
To: Charles Perry <charles.perry@microchip.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: a0bgvzyu1HWMs-MwDOmZu7sv807FTccv
X-Proofpoint-GUID: a0bgvzyu1HWMs-MwDOmZu7sv807FTccv
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adef156 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8
 a=zSspsWrCrnI3V3ylwmgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX1dm2b5qb4too
 8xxJGHVzX0S9Z/aLNamsv113o0Dl9cnClpbPH2m5NTD12beLP0iFXFJ5PEUiy3wujYZ4pK5Qync
 IrXb4S75nYpBF0Se5kq4UxmEU2UYOpQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXyEILBET1H2Qk
 UGP0LCc+iHkt43KunHXg2smUVTRyEVxoQZRU/74hk7sdJ3M1ypkuT208xbZaPTvBR5OERuLo3+d
 EjGKbMvW5nI856K+AmHQ03UFex21Wr4so+GBztFvhC6s+C+nuk19v1fWVhrrWby3BJfNH5pWb24
 erXAnqhfOtXLrZaDLVIolsUPG2/FoC3fp6hVdQ9BqhajgEMAMiCwqk5V4/lGluap7Owl3Eu3r/Z
 rEyyEQ3eqj6Mu9AnqPRQoPe8+xA40v/2XEovlipTpD1a90jRWsGxAJ3sAhs/A8pMmsxghWeps4S
 xs9Cymzn3IeeaLYSZTxsr6eJkowZNd8HYVwzc2QpjEsY6rj8Z42Utv5tM32XelqgiQ+lDsoR+/R
 ASjL4TUMxOFZ02UdARVNO2C1PjxpXaxnN5bQ7I1wdjoLqI1EEsB0kkyC0oLv+VsZoT+0eZ6U4LQ
 SeI+NqYSOM0LWZDSvWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Charles,

On Tue, Oct 13, 2026 at 11:42=E2=80=AFPM Charles Perry
<charles.perry@microchip.com> wrote:
>
> On Thu, Sep 17, 2026 at 10:52:42AM +0530, Subrahmanya Lingappa wrote:
> > Add helper routines for describing RPMI shared-memory mailbox transport=
s
> > and service child nodes in the RISC-V virt device tree.
> >
> > The helpers keep RPMI node construction in one place so the virt machin=
e
> > can add service groups without open-coding compatible strings, channel
> > IDs, interrupts, and shared-memory references at each call site.
> >
>
> Hello Subrahmanya,
>
> I'm wondering if the services should be siblings of the mailbox nodes
> rather than child. i.e., should we use:
>
> ```
>         rpmi: mailbox@10200000 {
>                 reg =3D <0x00 0x10200000 0x00 0x400 0x00 0x10200400 0x00 =
0x400 0x00 0x10230000 0x00 0x1000>;
>                 reg-names =3D "a2p-req", "p2a-ack", "a2p-doorbell";
>                 #mbox-cells =3D <0x01>;
>                 riscv,slot-size =3D <0x40>;
>                 compatible =3D "riscv,rpmi-shmem-mbox";
>         };
>
>         suspend {
>                 mboxes =3D <&rpmi 0x04>;
>                 compatible =3D "riscv,rpmi-system-suspend";
>         };
> ```
>
> instead of what is currently done in this series:
>
> ```
>         rpmi: mailbox@10200000 {
>                 reg =3D <0x00 0x10200000 0x00 0x400 0x00 0x10200400 0x00 =
0x400 0x00 0x10230000 0x00 0x1000>;
>                 reg-names =3D "a2p-req", "p2a-ack", "a2p-doorbell";
>                 #mbox-cells =3D <0x01>;
>                 riscv,slot-size =3D <0x40>;
>                 compatible =3D "riscv,rpmi-shmem-mbox";
>
>                 suspend {
>                         mboxes =3D <&rpmi 0x04>;
>                         compatible =3D "riscv,rpmi-system-suspend";
>                 };
>         };
> ```
>
> It's not clear to me what the correct way of doing this is. I've noted th=
at
> `make CHECK_DTBS=3D1` yields one more error when the services are child t=
han
> when they are siblings:
>
> virt.dtb: mailbox@10200000 (riscv,rpmi-shmem-mbox): 'hsm', 'suspend', 'sy=
sreset' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/mailbox/riscv,rpmi=
-shmem-mbox.yaml
>
> Thanks,
> Charles
>

Thanks, you are right. RPMI service groups are mailbox clients rather
than child nodes of the mailbox controller.

The current child-node layout also violates the mailbox binding=E2=80=99s
additionalProperties: false rule.
 We will emit the service nodes as siblings of the mailbox node,
retain their mboxes references,
 and update the documentation and tests accordingly.

Thanks,
subrahmanya

