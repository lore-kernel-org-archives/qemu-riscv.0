Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CF3C44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:06:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllpn-0008Rf-Pm; Mon, 20 Jul 2026 07:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllpl-0008Ij-CK
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:06:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllpj-0003eg-DX
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:06:53 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvnvY2326069
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJv7+Gv0zK/wu1dnqyCdssPDKIHV7fNZoHB2V7OGyGI=; b=I/t6YE1D7ed/swI3
 dcb4Z0Md15H4elB05Kt8U7w7sFCJ62X0FW8eLH37sJO6Q+HG9degCqHFym1C3IOC
 rBPXN8Jd/NDPRXqKyslnCCcSWN/YeSUjp1f2IpkjZfbDb6/y5iRqA3pbKzD3sgOZ
 K42ABVI+JXUCB6+KX3CoIusQqJu3uJqZ1yNv/qvFZmMpSNMprX0zChaIWECcrIvO
 dGI7VRIt/mXhjCb+qrgKY5beBspHsyA9pYBQSheVMUxeIrxXjJrsXTvktwhZukvb
 cqsSYfloZmr7phtq4jd/rZ5mrG/MpM8cNreukQcRkwcVIvp3+5kVrmrwyDKOpkon
 JTGfdQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04vyv4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:06:46 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-664b1b06f81so2585947d50.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784545550; cv=none;
 d=google.com; s=arc-20260327;
 b=kYCZDtk7s0XZXDekyP61xi+s+7810A3cWboiBQxStl1eW+8dKXqVoEfCG1CKCivtuw
 j8e3Ix+sC8AnMnJGr6Tm/Y20imUviVw0hfCbCg12MXqzZW1XFsn9YxPRqAZE4b/Gurb0
 qU/x06nOIFmY/JuSk2dCTO/jUAz/tpQeQxb9rtE7yIgPnQozu3PUtMK7gVip/o9idkDl
 bQTZ4D7g9ksX/GI9iYfUx5L4Pbn6vdqdPLLM7IDO+uLf4vtiaYAhYqNht/JKka8vP6VI
 zZz9qefN8RBf3nexXmZPfibZjU0EyVPLg5q2rrOWHA7eAabZ+ifcWIODmfhOzAyLyhb8
 rfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sJv7+Gv0zK/wu1dnqyCdssPDKIHV7fNZoHB2V7OGyGI=;
 fh=FB4bcYYNU1TeChBauDq3lxEwf4s7bQRy2o0AG86uxNE=;
 b=ADmDPb0ArFEYMaPPne1WyRZvuFs0QuLPfc9YZcegpG2qjxMXhGCCQB+J5WbSq43vOR
 qQybB6sPeUNuA2SsspLQZq/uf3lzpFC81WP5edWVB07Q4XkgZvU9O8jshaNDCbttUpxm
 R8A7bq7yx1E07OkVe6LkpYa0kJ7wyrtYy5ivZU1lCpY4kesz1csaLgE9d2WRSWTCdYdG
 +HJvdOHx0Lp6TmHU1YsuZxbbHml9xWSj7n/6txxDqOFLfcMEqMRp9sUgMxqvTsbzCW+R
 Mwc2uTWnM/9drJ7Dy+kTA82asFETxEV0ji/sgB8rAcuxGwVjX8xcoJ5zKFiT1F5zjpdS
 GVHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545550; x=1785150350; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sJv7+Gv0zK/wu1dnqyCdssPDKIHV7fNZoHB2V7OGyGI=;
 b=SUq1NqgaOzkMGXDjsK8+OTntG6+zOPMJ7LpPTZOMctPalcy7Q5uAjAia7vMIrRvCN0
 n52SUEmzILjLsMPr0s5PdRNSEzpzCALPqPTTZx6ZMJPCsEAA/E0B+jNb4vxIWfZeYgnU
 4NV88gUBXZ7xfHigjBgWILJsW4I9Xa754qu88D1vE781UAleLTHGqydCrFR67CMHXIcg
 uAKRnRnC/8R8th5ulB/I1Gt3Ky26UEFCMcLwAt1ccisVMA2t2mrVp8qdkY1EoyeClJxZ
 ywNbbjvt+aVBwsJdU8uuyKfLQXMt+U1F95iNKQBwqKOyvax9IHlgc6QO8acIRUvNHIm/
 sPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545550; x=1785150350;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sJv7+Gv0zK/wu1dnqyCdssPDKIHV7fNZoHB2V7OGyGI=;
 b=K8pTnRUzGrpqWo8m+B+K8Lo9kEcQiqRza7eBDfL8oMyoqkZSlGcNP7HZdswXJd+QmB
 bbDyvzWT3CR67LOlxpkrRjrfjykKUKXBeP8kU+Daq2/D+DuK5E22QGCfXkx7uSz0+yhL
 pb5zprSKS3TSESKBvd+/MRUYLZTUaJp2/CKmsvKDV2hyfHLg31B5ndyneitPCQSOivyf
 05+ZUWoO9r38EO/pKF4TI5B7D7AGkBnCfQiGjhsWwnWRgNdaRzdFWGHv0KXVHOncnCKf
 eXGo5JtAC6OTYUPwP7hjudLeoOPsdbtVb4PkoBEmSI7pTJW76yxelZbUmBEVp/ydF+oi
 vPng==
X-Gm-Message-State: AOJu0Yy6lvtYBiKIE0p6OKhFnuyt3W5DCGrtkAgrY6brG2dPzzmOWV8Z
 38b7Pu7cULAWrkWGBJY4VrfmnKyz9j33iqqkiDzC1Re/yWfP3QuOX6ZFfEnYHnzWjoUg8rfzK1S
 EHJTZ0pYFr6/usbZy0zSIfELq54yW/gV4Kb75E3uRUqtHeVlDQTHIlGHBqc6zpIctd3GIBV8dRP
 pChWrPzmAs7o1imBFz0T8PXeTEenr2YXPl
X-Gm-Gg: AR+sD11oiq7QDqQWCEKluNIr09Vq3bLIeOz+dMSUpf2odtTt2Wln5XJIhKM0r/lgrrE
 XqUV3EqE5/norzz1uA0qxaxRJRIN6tgifyhaIYV7HZbh2Wh/rC03ebhztzEDMi+eugkn4KNe4Jk
 vNnrGPu7hswyZ5QbP7OoQ6F9nGXiGYA3FuWT5cLQnHNbXyqdmcjhnOtoXpgw0=
X-Received: by 2002:a05:690c:9990:b0:81a:ea53:c40b with SMTP id
 00721157ae682-81ef2672ae7mr44629537b3.8.1784545549901; 
 Mon, 20 Jul 2026 04:05:49 -0700 (PDT)
X-Received: by 2002:a05:690c:9990:b0:81a:ea53:c40b with SMTP id
 00721157ae682-81ef2672ae7mr44629357b3.8.1784545549432; Mon, 20 Jul 2026
 04:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-2-subrahmanya.lingappa@oss.qualcomm.com>
 <e0a13116-ecfb-481e-a883-5c95e3b31b73@oss.qualcomm.com>
In-Reply-To: <e0a13116-ecfb-481e-a883-5c95e3b31b73@oss.qualcomm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:35:38 +0530
X-Gm-Features: AUfX_myFHzKRRGIWqOEBb6DNVLSBLify9UnYarl8reLlfSA9wltntYQmTVaiOLI
Message-ID: <CAPxK-6fRW7gXXcpDmJqDwc_19uUDnRiOPR0R5bmju_a8+DL+zg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] build: add optional librpmi dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5e0146 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=LgkO7a-NOqtw3HH30u4A:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX1R4wuRc9M1FU
 AcZT2WwQbEhqpNAiy4np1NFTr76kCZFnkFC98VOhLrxxuzpn4YKQw+zg2rbc/FGtx9irDVakAWg
 flv2ZA1TmEwuDNlfNcJIUIES2r1SLTSG6JcL8Fb1WkvE9HEptLxgJ1kQ32hjtZ2P9TBVE1KUlVE
 tfLCrDi1opBu/J2WFiC5yPr5yP4cSbRYibTVn2Ko2cU8Ol7a/EZm4u1ih3ZvbHQFfThojEvLkhw
 MUMtyQ614ftp/7g+RsDKN1Kh/A6sj4gAvbDEHkw0nzRawAGJ3A5U11H/ExGP/En0AfQi4qkV5D9
 FG4yS07QpoJI6xWpSEs3hqv6tIiCMJmA3Kpq/HYItP7vlXivDVURd3pbuWI6eO8H34ofvKDcD3g
 WQI8rXm2H/yhXXe+IDWAMBYB3C3JVR8J2qUJcoBg2XNoe6hA0sEawzoQpJoX8ythgE8skT5PN3q
 TOgPR65OFcsw5VRlV7A==
X-Proofpoint-ORIG-GUID: G7cPtMeikt2FNMuO851HtYNL8YEFm7Ze
X-Proofpoint-GUID: G7cPtMeikt2FNMuO851HtYNL8YEFm7Ze
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfXwg17P7pDbq2K
 5NZ43ABKS1XZPhivYUQYfXzD1Dkjb8tsTQ43oz1FvqkqqglwoVLFR0HgloKNUnFfetiPjIZgCeK
 GZzPG2gA3mIJ7LBNLn3yZD1bIEga2vI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200123
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Philippe

On Mon, Jul 20, 2026 at 2:49=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 14/7/26 09:56, Subrahmanya Lingappa wrote:
> > Add a meson option and config probe for librpmi so RISC-V machines can
> > opt into RPMI support when the library is available. Keep the dependenc=
y
> > optional so default builds without librpmi continue to work.
> >
> > Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.=
com>
> > ---
> >   Kconfig.host                  |  3 +++
> >   meson.build                   | 14 ++++++++++++++
> >   meson_options.txt             |  2 ++
> >   scripts/meson-buildoptions.sh |  3 +++
> >   4 files changed, 22 insertions(+)
>
>
> >   ignored =3D [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
> > @@ -4971,6 +4984,7 @@ summary_info +=3D {'TPM support':       have_tpm}
> >   summary_info +=3D {'IGVM support':      igvm}
> >   summary_info +=3D {'libssh support':    libssh}
> >   summary_info +=3D {'lzo support':       lzo}
> > +summary_info +=3D {'librpmi support':   librpmi}
>
> "rpmi support"?
>
> >   summary_info +=3D {'snappy support':    snappy}
> >   summary_info +=3D {'bzip2 support':     libbzip2}
> >   summary_info +=3D {'lzfse support':     liblzfse}
> > diff --git a/meson_options.txt b/meson_options.txt
> > index a07cb47d35..9f773a7886 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -204,6 +204,8 @@ option('lzfse', type : 'feature', value : 'auto',
> >          description: 'lzfse support for DMG images')
> >   option('lzo', type : 'feature', value : 'auto',
> >          description: 'lzo compression support')
> > +option('librpmi', type : 'feature', value : 'auto',
> > +       description: 'RISC-V RPMI support')
>
> Either "RISC-V PMI" or "RPMI".
>
> >   option('pvg', type: 'feature', value: 'auto',
> >          description: 'macOS paravirtualized graphics support')
> >   option('rbd', type : 'feature', value : 'auto',
> > diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions=
.sh
> > index c003985047..e8a20068e7 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -140,6 +140,7 @@ meson_options_help() {
> >     printf "%s\n" '  libkeyutils     Linux keyutils support'
> >     printf "%s\n" '  libnfs          libnfs block device driver'
> >     printf "%s\n" '  libpmem         libpmem support'
> > +  printf "%s\n" '  librpmi         RISC-V RPMI support'
>
> Ditto, "RPMI support", otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
>
> >     printf "%s\n" '  libssh          ssh block device support'
> >     printf "%s\n" '  libudev         Use libudev to enumerate host devi=
ces'
> >     printf "%s\n" '  libusb          libusb support for USB passthrough=
'
> > @@ -376,6 +377,8 @@ _meson_option_parse() {
> >       --disable-libnfs) printf "%s" -Dlibnfs=3Ddisabled ;;
> >       --enable-libpmem) printf "%s" -Dlibpmem=3Denabled ;;
> >       --disable-libpmem) printf "%s" -Dlibpmem=3Ddisabled ;;
> > +    --enable-librpmi) printf "%s" -Dlibrpmi=3Denabled ;;
> > +    --disable-librpmi) printf "%s" -Dlibrpmi=3Ddisabled ;;
> >       --enable-libssh) printf "%s" -Dlibssh=3Denabled ;;
> >       --disable-libssh) printf "%s" -Dlibssh=3Ddisabled ;;
> >       --enable-libudev) printf "%s" -Dlibudev=3Denabled ;;
>

  Fixed in v4. I changed the user-facing Meson option/help/summary text
  to "RPMI support" instead of "RISC-V RPMI support".

Thanks,
Subbu

