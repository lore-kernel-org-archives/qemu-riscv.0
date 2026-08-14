Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DA5C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 04:55:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wujvI-0008Oq-Rj; Fri, 14 Aug 2026 00:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvH-0008O3-0U
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:53:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvF-0005K1-7Z
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:53:38 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4QpX4594126
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NaClFsqxS+TPXljZw7gIEM/IeT0qj7A93m7IQOhOzMA=; b=lRVYNvx+L+tsKDpw
 1jM+cZ3cLzj+aKw512znt5DElhdA+wlNKJwrIiQrhhB8SSLa66JuMDflUMLug/4X
 pTmCV7MPhuzXZ3K3OwZpGYGRHGh49inbxZfkPHHJKZgwJpf5DhPZY6EWqF6kLFBA
 DgmIC9e9BpqC93PlTLULwcFeFHzC+Nye4bZjsyAbqf3Mqp3ILYFB+hWcJcykjwIq
 tzjFSZ7yXIEkRIMIiqim2WicYnRInfbIn82cXLu4HGwDe026gwjiJ/75JOZa9DAn
 O+kZpJu8wxg9OL707YYeALJWhJHTlMWfs5JcWlv6keR1oQIC8O4wuLIvdufsV8fU
 8oFOtA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4tnh4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:53:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2d371c85362so1315545ad.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 21:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786683215; x=1787288015; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NaClFsqxS+TPXljZw7gIEM/IeT0qj7A93m7IQOhOzMA=;
 b=dzTjB9E9i5nP1WnZTYc000cu6vLcdDtbX5O47orh2rN9BE5O15zpn5pJsxVROggdNu
 KakZL20CzSnD2gsybttR1u0QsrAd3whF6viJdYQ24dvRWIs5gDbhdkr27Ki2D3fjAVrB
 Y848xIvrusodpVJQCbHdYR+0NeuWWaP+Q8ghIhNIcADIa9LalqrEH6E9+u+Sty7L//3U
 dJg4QYxNKxVB4cSilXimZTcjWLryGKfF+t8rOJ7UHo521I6vrYsmsRRRgW/Gh5Qau3GW
 ccGM9WhRMaCLSek44U4uSvri0cMgM3gMe90Upp1mqOen0Fihe4CmmDJaa0etDZAVTKwY
 RjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786683215; x=1787288015;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NaClFsqxS+TPXljZw7gIEM/IeT0qj7A93m7IQOhOzMA=;
 b=PftAAm4h35K/8r7zSw0HjwEf1bdDn5bQZnxuxyR4HkKQR/I4VuVN59Dh9tpgOKcIs7
 oz0ogbemd5SCG8qLi1bfowJBoYXy7cA4326ql4TmME1oFX5IqyLyaUH/vBbqhfOexmMs
 MA3OD1H2ngkK5/HFqvLpMgaVJGpAQbBuzG6K/MyfrmUssyKhYnMg/HdQzYw7RYOj1zLJ
 cRZC70yMzaQpfcWmNlH+mRzT0zbwvZUewpusAaXg9goqUB2nJs/mM1OjCxhhQ6f9J+ci
 150RHLVywVVvr4x9OHrxu3PNY/m+KE6JAU9vq4Qq5Y65PjWxSSv/3d+PPaOfmgUU6Kvn
 7a2g==
X-Gm-Message-State: AOJu0YyOf5EvNGjtWMFsOmdEVz+7Ebes6UyMhH59IgImRiDzYb2zAXwt
 7mmP7yhNwQw9AaLDPmVmDQvyjJWJwFzj/cf1AWfwZsuA8z3FtKsysgnSmvoFcN3oZyl12jQXk95
 H2QbH5Mx2bL2vfu2JMlF/NU/mOhHBcZWG4uDHXUcs4Dk6S6wU5RQ4Fp0Gma6uFo7NQA==
X-Gm-Gg: AR+sD10yySy42hmbD4P5z7Ys7Vc9fEqhLnhoO6fsc37MchywDM6o5MI2ODGVerIDRu8
 rIMQkfc0dFz9LcoRcKjWndC+AZRcduOuGOmK31t/+HuKY8E//MSnY1Iai4noGeLmWvZ6X1GxvBV
 xULmBZoMC5Tyceiocd3uXsQHO/tigRha+OrVHCWvhkirpB1joCMAJ0o7T4APq0v5rl9K7+Da9n2
 6qSKKoxjnnomQt2SDf96yklX/lFiLTZXiVfw9VgUQXDprfypFRZhMejkgN7t9TAQXn4uFLjM4jE
 L8cj+l1KbZcDewo3X3ja3BHCHxndKz7lVpAuWJtSttvbkOYn+s75GSiTlaYvvo4u/amjy4dlgD+
 j33/alyhZjhyoMdW2JguN4TEFAXcN90AhSjqHPGGJP/e4wNvZWa31op0TJVz2L2SymU/et/oWyk
 GHbyHCg6JlrzQ5jUq9HbMiDkt0hJpT6Tc=
X-Received: by 2002:a17:903:22cb:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d3b0c5dd2amr26392685ad.2.1786683215221; 
 Thu, 13 Aug 2026 21:53:35 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d3b0c5dd2amr26392365ad.2.1786683214734; 
 Thu, 13 Aug 2026 21:53:34 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31f15063cd8sm10625665eec.9.2026.08.13.21.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 21:53:34 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v8 01/10] build: add optional librpmi dependency
Date: Fri, 14 Aug 2026 10:23:05 +0530
Message-ID: <20260814045315.3416169-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4ugI9cDYdgmbYW0dJd04fFyOfl2-R1wI
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7e9f50 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_6tmRKQHnRYSWcN6IbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX8Mib2TeRpYs8
 6j/YKtSFd4yQnUeZRAonoDSv8kdt1ZphVsXGWhohO9tVwiQRLmi+VvuDcrJtKG70NfRKHNFzzcV
 hC6b7O52uEo5t2f+0PgycVQYXBKIKyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX6VvRqbL5YanM
 Ht1D0AJ3soGyi20MNQviA6ENBl/3reqNRTJnz2+FF8AkuN0SkBLFthXpsQuo2JwkkDA6Yg3uDLA
 CQJI/5OTPo1BGnFh+WhMSx+JpBqM9ORFWAqofeyqSJhJ/8fAA44kJR783Hv+KE/fOUBBqrQ3Unz
 5zdtclUil0FgJgUSpkKTW5j7eiRWuvs8/kfKSBoaNMr1OAQ5awN+O+UHI9syl5/CZMGLJsCYf3l
 t82seoODYeC9OZUlF0Z+XBGjDifBo/6WYuzNZ48EcRn3wYiPGqLbHILDO2j/qKhjx0X3Sgq8tB5
 PHwHp35gAJG/Zk+yj4VFoVq1zgm2AFug/UJyDBH4WoZ00GBMuA6bo9aZ2FUdzOLQYmPwGgWpdzp
 1He0xeozVHJebFR0lg/iDSe4U12dCgWJ+lJmvxdFCFNoy+HN1AL9YWqBh7F+Kl/AyimU+ZvkP8J
 ywZhvyFAyIZuu1sZhRg==
X-Proofpoint-GUID: 4ugI9cDYdgmbYW0dJd04fFyOfl2-R1wI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140036
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add a meson option and config probe for librpmi so RISC-V machines can
opt into RPMI support when the library is available. Keep the dependency
optional so default builds without librpmi continue to work.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 Kconfig.host                  |  3 +++
 meson.build                   | 14 ++++++++++++++
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/Kconfig.host b/Kconfig.host
index 933425c74b..6f98dadb2e 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -8,6 +8,9 @@ config LINUX
 config LIBCBOR
     bool
 
+config LIBRPMI
+    bool
+
 config GNUTLS
     bool
 
diff --git a/meson.build b/meson.build
index 19e123423b..272872602e 100644
--- a/meson.build
+++ b/meson.build
@@ -2005,6 +2005,17 @@ if lzo.found() and not cc.links('''
   endif
 endif
 
+librpmi = not_found
+if not get_option('librpmi').auto() or have_system
+  librpmi = dependency('librpmi', required: get_option('librpmi'),
+                       method: 'pkg-config')
+  if librpmi.found() and not cc.has_header_symbol('librpmi.h',
+                                                  'rpmi_service_group_syssusp_create',
+                                                  dependencies: librpmi)
+    error('librpmi support requires the RPMI system suspend service group API')
+  endif
+endif
+
 numa = not_found
 if not get_option('numa').auto() or have_system or have_tools
   numa = cc.find_library('numa', has_headers: ['numa.h'],
@@ -2427,6 +2438,7 @@ config_host_data.set('CONFIG_LINUX', host_os == 'linux')
 config_host_data.set('CONFIG_POSIX', host_os != 'windows')
 config_host_data.set('CONFIG_WIN32', host_os == 'windows')
 config_host_data.set('CONFIG_LZO', lzo.found())
+config_host_data.set('CONFIG_LIBRPMI', librpmi.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_BLKIO', blkio.found())
 if blkio.found()
@@ -3258,6 +3270,7 @@ host_kconfig = \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
   (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (librpmi.found() ? ['CONFIG_LIBRPMI=y'] : []) + \
   (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
@@ -4971,6 +4984,7 @@ summary_info += {'TPM support':       have_tpm}
 summary_info += {'IGVM support':      igvm}
 summary_info += {'libssh support':    libssh}
 summary_info += {'lzo support':       lzo}
+summary_info += {'RPMI support':      librpmi}
 summary_info += {'snappy support':    snappy}
 summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
diff --git a/meson_options.txt b/meson_options.txt
index a07cb47d35..a65af0e633 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -204,6 +204,8 @@ option('lzfse', type : 'feature', value : 'auto',
        description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
+option('librpmi', type : 'feature', value : 'auto',
+       description: 'RPMI support')
 option('pvg', type: 'feature', value: 'auto',
        description: 'macOS paravirtualized graphics support')
 option('rbd', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c003985047..12179f6024 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -140,6 +140,7 @@ meson_options_help() {
   printf "%s\n" '  libkeyutils     Linux keyutils support'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
+  printf "%s\n" '  librpmi         RPMI support'
   printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
@@ -376,6 +377,8 @@ _meson_option_parse() {
     --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
     --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
     --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
+    --enable-librpmi) printf "%s" -Dlibrpmi=enabled ;;
+    --disable-librpmi) printf "%s" -Dlibrpmi=disabled ;;
     --enable-libssh) printf "%s" -Dlibssh=enabled ;;
     --disable-libssh) printf "%s" -Dlibssh=disabled ;;
     --enable-libudev) printf "%s" -Dlibudev=enabled ;;
-- 
2.43.0


